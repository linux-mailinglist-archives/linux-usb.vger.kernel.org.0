Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0445328FB94
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 01:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387641AbgJOXRb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Oct 2020 19:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgJOXRa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Oct 2020 19:17:30 -0400
X-Greylist: delayed 19916 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Oct 2020 16:17:27 PDT
Received: from mailfilter.crc.id.au (mailfilter.crc.id.au [IPv6:2407:e400:b000:200::94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C34C061755
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2020 16:17:27 -0700 (PDT)
Received: from mailfilter.crc.id.au (localhost [127.0.0.1])
        by mailfilter.crc.id.au (Proxmox) with ESMTP id 2B9DE80FC2
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2020 10:17:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crc.id.au; h=cc
        :content-type:content-type:date:from:from:message-id
        :mime-version:reply-to:subject:subject:to:to; s=default; bh=IQGs
        LTYjYpu6DiC+cyveAsGKQv6+zsItWFrt8BzHqCQ=; b=CI6+5UEDVovJndkRYiab
        zTClFniBsT9uhDg0HL0a/VY/4vKQe8FbZMSP4G8u7/Pbeul8XSQywbbnxJz9JeWd
        wpcKaNg3lg6ALi+VVkBqYxegjVsABlmHlwhHmBZOuGvqTlsrKrAmn2NQRH1RV1si
        5bMDa+ndU9C99k/dCn6XpmnAub6MGEbWoR5q6b3Ty7p7OSlNK4HDexO81N3ybp0a
        ydcclKFe2MLkq1vLjRd+reomfLtPGoF3ZLkV1anSERHls5ii2cvmPDEwj6SYxlWi
        7u6GiLMxZ5lOvuccmfrbjrMIcYdtCQDEnKND+d3Mw4ldABT+pF73S55saNWwB4j6
        zI+LzO26C7W7wpFHqOHW+ESGce+B3QWP1gbWMhUtL5z337zd70asK7W8o9HJV13i
        h4We8WMOSZIkdCuTuhp6w8SgbmGli6kOaw5bwyn0drSOkKRAyn9FYhhZghyKlaEK
        y7bOJf/3/reUMROFBf6ltd1yl8pRboginy5LHsh/NXVj34fY02xbJPnYppH7nOF3
        +63Ngy+sIFlPTJlKAPFR3n4QSDQB0b27qdhNiUZg/JnIYiACCouhmzBtQhdTwrUW
        WBYlEa9uy8oYWZMhewT8GSj48gdU4s2xmC0UWtVgIAgPg0NCVrRN7omK0+l9NpyS
        njg/nCvsXcwbAjy8cDiT2aE=
Date:   Fri, 16 Oct 2020 10:17:16 +1100
From:   Steven Haigh <netwiz@crc.id.au>
Subject: Slow USB init on 5.8.9 / 5.8.14 / 5.9.0
To:     linux-usb@vger.kernel.org
Message-Id: <SCN9IQ.KCG4KDJJ6OC73@crc.id.au>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-XKtYROG54HtIajaGSmXz"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-XKtYROG54HtIajaGSmXz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

I've trying to debug a problem I've noticed with the Fedora 33 Beta,=20
that seems to be related to USB ports.

I tried even with the 5.9.0 kernel from the rawhide / fc34 tree, but=20
the same problem occurs.

I've added an example dmesg from a boot with USB problems, and I've=20
noticed that systemd-analyze blame shows:
47.297s dracut-initqueue.service

I notice that when I get this issue, on booting, the BIOS will init all=20
the USB devices, and the light on each USB port on my hub comes on=20
together. When the kernel boots, all the lights on the USB hub goes off=20
and then either don't light up at all, or there is about 5-6 seconds=20
between each port coming online.

The system is a Ryzen 2700x with an MSI X470 GAMING PRO CARBON=20
(MS-7B78) mainboard.

Output of lsusb:
Bus 004 Device 004: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 004 Device 002: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 007: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838=20
DVB-T
Bus 003 Device 013: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 003 Device 011: ID 045e:0008 Microsoft Corp. SideWinder Precision=20
Pro
Bus 003 Device 010: ID 046d:0a01 Logitech, Inc. USB Headset
Bus 003 Device 008: ID 0a12:0001 Cambridge Silicon Radio, Ltd Bluetooth=20
Dongle (HCI mode)
Bus 003 Device 005: ID 2109:2811 VIA Labs, Inc. Hub
Bus 003 Device 003: ID 03f0:7d04 HP, Inc DeskJet F2100 Printer series
Bus 003 Device 004: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 003 Device 002: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 006: ID 058f:6364 Alcor Micro Corp. AU6477 Card Reader=20
Controller
Bus 001 Device 004: ID 13fd:160f Initio Corporation RocketFish SATA=20
Bridge [INIC-1611]
Bus 001 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 007: ID 1050:0407 Yubico.com Yubikey 4/5 OTP+U2F+CCID
Bus 001 Device 005: ID 1532:0228 Razer USA, Ltd BlackWidow Elite
Bus 001 Device 003: ID 1b1c:0c04 Corsair Link Cooling Node
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

I do note that my USB keyboard still works when this fault occurs, so=20
it does seem to be something specific to either that controller, or the=20
USB hubs attached (or both).

Where abouts do we start with something like this?

Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au
=F0=9F=92=BB https://www.crc.id.au


--=-XKtYROG54HtIajaGSmXz
Content-Type: text/plain
Content-Disposition: attachment; filename=usbfail-5.9.0-fc34.txt

[    0.000000] Linux version 5.9.0-36.fc34.x86_64 (mockbuild@bkernel01.iad2.fedoraproject.org) (gcc (GCC) 10.2.1 20201005 (Red Hat 10.2.1-5), GNU ld version 2.35.1-5.fc34) #1 SMP Mon Oct 12 13:40:33 UTC 2020
[    0.000000] Command line: BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.9.0-36.fc34.x86_64 root=UUID=759df463-2274-4c2a-8a25-f18f862d9db5 ro rootflags=subvol=root rhgb quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009d7ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000009d80000-0x0000000009ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a20afff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000000a20b000-0x000000000affffff] usable
[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000dbc4afff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dbc4b000-0x00000000dbdbafff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000dbdbb000-0x00000000dbf3cfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000dbf3d000-0x00000000dc353fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000dc354000-0x00000000dcfcbfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000dcfcc000-0x00000000deffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000df000000-0x00000000dfffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xd7ff5018-0xd8004057] usable ==> usable
[    0.000000] e820: update [mem 0xd7ff5018-0xd8004057] usable ==> usable
[    0.000000] e820: update [mem 0xd7fdb018-0xd7ff4457] usable ==> usable
[    0.000000] e820: update [mem 0xd7fdb018-0xd7ff4457] usable ==> usable
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000009d7ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000009d80000-0x0000000009ffffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000a000000-0x000000000a1fffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000a200000-0x000000000a20afff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x000000000a20b000-0x000000000affffff] usable
[    0.000000] reserve setup_data: [mem 0x000000000b000000-0x000000000b01ffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000000b020000-0x00000000d7fdb017] usable
[    0.000000] reserve setup_data: [mem 0x00000000d7fdb018-0x00000000d7ff4457] usable
[    0.000000] reserve setup_data: [mem 0x00000000d7ff4458-0x00000000d7ff5017] usable
[    0.000000] reserve setup_data: [mem 0x00000000d7ff5018-0x00000000d8004057] usable
[    0.000000] reserve setup_data: [mem 0x00000000d8004058-0x00000000dbc4afff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dbc4b000-0x00000000dbdbafff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dbdbb000-0x00000000dbf3cfff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dbf3d000-0x00000000dc353fff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000dc354000-0x00000000dcfcbfff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dcfcc000-0x00000000deffffff] usable
[    0.000000] reserve setup_data: [mem 0x00000000df000000-0x00000000dfffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fd000000-0x00000000ffffffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000081f37ffff] usable
[    0.000000] efi: EFI v2.70 by American Megatrends
[    0.000000] efi: ACPI 2.0=0xdc2d0000 ACPI=0xdc2d0000 SMBIOS=0xdce17000 MEMATTR=0xd8106698 ESRT=0xd86faf98 RNG=0xdce31f18 
[    0.000000] efi: seeding entropy pool
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: Micro-Star International Co., Ltd. MS-7B78/X470 GAMING PRO CARBON (MS-7B78), BIOS 2.E3 06/12/2020
[    0.000000] tsc: Fast TSC calibration failed
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] last_pfn = 0x81f380 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF write-through
[    0.000000]   C0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000000 mask FFFF80000000 write-back
[    0.000000]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.000000]   2 base 0000C0000000 mask FFFFE0000000 write-back
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] TOM2: 0000000820000000 aka 33280M
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==> reserved
[    0.000000] last_pfn = 0xdf000 max_arch_pfn = 0x400000000
[    0.000000] esrt: Reserving ESRT space from 0x00000000d86faf98 to 0x00000000d86fafd0.
[    0.000000] e820: update [mem 0xd86fa000-0xd86fafff] usable ==> reserved
[    0.000000] Using GB pages for direct mapping
[    0.000000] secureboot: Secure boot disabled
[    0.000000] RAMDISK: [mem 0x5a423000-0x5cd3cfff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000DC2D0000 000024 (v02 ALASKA)
[    0.000000] ACPI: XSDT 0x00000000DC2D0098 0000B4 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FACP 0x00000000DC2D78E0 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: DSDT 0x00000000DC2D01E8 0076F1 (v02 ALASKA A M I    01072009 INTL 20120913)
[    0.000000] ACPI: FACS 0x00000000DC33CE00 000040
[    0.000000] ACPI: APIC 0x00000000DC2D79F8 00015E (v03 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FPDT 0x00000000DC2D7B58 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: FIDT 0x00000000DC2D7BA0 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: SSDT 0x00000000DC2D7C40 0000FC (v02 ALASKA CPUSSDT  01072009 AMI  01072009)
[    0.000000] ACPI: SSDT 0x00000000DC2D7D40 008C98 (v02 AMD    AMD ALIB 00000002 MSFT 04000000)
[    0.000000] ACPI: SSDT 0x00000000DC2E09D8 003776 (v01 AMD    AMD AOD  00000001 INTL 20120913)
[    0.000000] ACPI: MCFG 0x00000000DC2E4150 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
[    0.000000] ACPI: HPET 0x00000000DC2E4190 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
[    0.000000] ACPI: SSDT 0x00000000DC2E41C8 000024 (v01 AMDFCH FCHZP    00001000 INTL 20120913)
[    0.000000] ACPI: UEFI 0x00000000DC2E41F0 000042 (v01 ALASKA A M I    00000002      01000013)
[    0.000000] ACPI: IVRS 0x00000000DC2E4238 0000D0 (v02 AMD    AMD IVRS 00000001 AMD  00000000)
[    0.000000] ACPI: SSDT 0x00000000DC2E4308 002314 (v01 AMD    AMD CPU  00000001 AMD  00000001)
[    0.000000] ACPI: CRAT 0x00000000DC2E6620 000F50 (v01 AMD    AMD CRAT 00000001 AMD  00000001)
[    0.000000] ACPI: CDIT 0x00000000DC2E7570 000029 (v01 AMD    AMD CDIT 00000001 AMD  00000001)
[    0.000000] ACPI: SSDT 0x00000000DC2E75A0 001D4A (v01 AMD    AmdTable 00000001 INTL 20120913)
[    0.000000] ACPI: SSDT 0x00000000DC2E92F0 0000BF (v01 AMD    AMD PT   00001000 INTL 20120913)
[    0.000000] ACPI: WSMT 0x00000000DC2E93B0 000028 (v01 ALASKA A M I    01072009 AMI  00010013)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x81f355000-0x81f37ffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000009d7ffff]
[    0.000000]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
[    0.000000]   node   0: [mem 0x000000000a20b000-0x000000000affffff]
[    0.000000]   node   0: [mem 0x000000000b020000-0x00000000dbc4afff]
[    0.000000]   node   0: [mem 0x00000000dbdbb000-0x00000000dbf3cfff]
[    0.000000]   node   0: [mem 0x00000000dcfcc000-0x00000000deffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
[    0.000000] Zeroed struct page in unavailable ranges: 12683 pages
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37ffff]
[    0.000000] On node 0 totalpages: 8375925
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 29 pages reserved
[    0.000000]   DMA zone: 3999 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 14126 pages used for memmap
[    0.000000]   DMA32 zone: 904022 pages, LIFO batch:63
[    0.000000]   Normal zone: 116686 pages used for memmap
[    0.000000]   Normal zone: 7467904 pages, LIFO batch:63
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 17, version 33, address 0xfec00000, GSI 0-23
[    0.000000] IOAPIC[1]: apic_id 18, version 33, address 0xfec01000, GSI 24-55
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.000000] smpboot: Allowing 32 CPUs, 16 hotplug CPUs
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x09d80000-0x09ffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0a200000-0x0a20afff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd7fdb000-0xd7fdbfff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd7ff4000-0xd7ff4fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd7ff5000-0xd7ff5fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd8004000-0xd8004fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xd86fa000-0xd86fafff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdbc4b000-0xdbdbafff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdbf3d000-0xdc353fff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdc354000-0xdcfcbfff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xdf000000-0xdfffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfc000000-0xfcffffff]
[    0.000000] PM: hibernation: Registered nosave memory: [mem 0xfd000000-0xffffffff]
[    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:1
[    0.000000] percpu: Embedded 54 pages/cpu s184320 r8192 d28672 u262144
[    0.000000] pcpu-alloc: s184320 r8192 d28672 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.000000] pcpu-alloc: [0] 16 17 18 19 20 21 22 23 [0] 24 25 26 27 28 29 30 31 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8245020
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.9.0-36.fc34.x86_64 root=UUID=759df463-2274-4c2a-8a25-f18f862d9db5 ro rootflags=subvol=root rhgb quiet
[    0.000000] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 32677804K/33503700K available (14339K kernel code, 2523K rwdata, 8740K rodata, 2512K init, 4584K bss, 825636K reserved, 0K cma-reserved)
[    0.000000] random: get_random_u64 called from __kmem_cache_create+0x2e/0x550 with crng_init=0
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    0.000000] ftrace: allocating 44194 entries in 173 pages
[    0.000000] ftrace: allocated 173 pages with 5 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=32.
[    0.000000] 	Trampoline variant of Tasks RCU enabled.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] 	Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.000000] NR_IRQS: 524544, nr_irqs: 1224, preallocated irqs: 16
[    0.000000] random: crng done (trusting CPU's manufacturer)
[    0.000000] Console: colour dummy device 80x25
[    0.000000] printk: console [tty0] enabled
[    0.000000] ACPI: Core revision 20200717
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.000000] APIC: Switch to symmetric I/O mode setup
[    0.002000] Switched APIC routing to physical flat.
[    0.004000] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.012000] tsc: Unable to calibrate against PIT
[    0.012000] tsc: using HPET reference calibration
[    0.012000] tsc: Detected 3699.628 MHz processor
[    0.000002] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6aa7ed12073, max_idle_ns: 881590475095 ns
[    0.000004] Calibrating delay loop (skipped), value calculated using timer frequency.. 7399.25 BogoMIPS (lpj=3699628)
[    0.000005] pid_max: default: 32768 minimum: 301
[    0.003028] LSM: Security Framework initializing
[    0.003037] Yama: becoming mindful.
[    0.003041] SELinux:  Initializing.
[    0.003101] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.003142] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.003362] LVT offset 1 assigned for vector 0xf9
[    0.003414] LVT offset 2 assigned for vector 0xf4
[    0.003427] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.003428] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.003430] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.003431] Spectre V2 : Mitigation: Full AMD retpoline
[    0.003431] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.003432] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.003433] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.003615] Freeing SMP alternatives memory: 40K
[    0.108255] smpboot: CPU0: AMD Ryzen 7 2700X Eight-Core Processor (family: 0x17, model: 0x8, stepping: 0x2)
[    0.108351] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.108354] ... version:                0
[    0.108354] ... bit width:              48
[    0.108354] ... generic registers:      6
[    0.108355] ... value mask:             0000ffffffffffff
[    0.108355] ... max period:             00007fffffffffff
[    0.108355] ... fixed-purpose events:   0
[    0.108356] ... event mask:             000000000000003f
[    0.108382] rcu: Hierarchical SRCU implementation.
[    0.108486] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.108673] smp: Bringing up secondary CPUs ...
[    0.108737] x86: Booting SMP configuration:
[    0.108737] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
[    0.126031] smp: Brought up 1 node, 16 CPUs
[    0.126031] smpboot: Max logical packages: 2
[    0.126031] smpboot: Total of 16 processors activated (118388.09 BogoMIPS)
[    0.128663] devtmpfs: initialized
[    0.128663] x86/mm: Memory block size: 128MB
[    0.130038] PM: Registering ACPI NVS region [mem 0x0a200000-0x0a20afff] (45056 bytes)
[    0.130040] PM: Registering ACPI NVS region [mem 0xdbf3d000-0xdc353fff] (4288512 bytes)
[    0.130180] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.130180] futex hash table entries: 8192 (order: 7, 524288 bytes, linear)
[    0.130180] xor: automatically using best checksumming function   avx       
[    0.130180] pinctrl core: initialized pinctrl subsystem
[    0.130266] PM: RTC time: 04:32:06, date: 2020-10-16
[    0.130370] NET: Registered protocol family 16
[    0.130432] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.130437] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.130442] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.130446] audit: initializing netlink subsys (disabled)
[    0.130454] audit: type=2000 audit(1602822726.142:1): state=initialized audit_enabled=0 res=1
[    0.130454] thermal_sys: Registered thermal governor 'fair_share'
[    0.130454] thermal_sys: Registered thermal governor 'bang_bang'
[    0.130454] thermal_sys: Registered thermal governor 'step_wise'
[    0.130454] thermal_sys: Registered thermal governor 'user_space'
[    0.130454] cpuidle: using governor menu
[    0.130454] ACPI: bus type PCI registered
[    0.130454] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.131007] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
[    0.131009] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
[    0.131016] PCI: Using configuration type 1 for base access
[    0.132257] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.132257] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.214135] cryptd: max_cpu_qlen set to 1000
[    0.216272] alg: No test for 842 (842-generic)
[    0.216272] alg: No test for 842 (842-scomp)
[    0.218046] raid6: skip pq benchmark and using algorithm avx2x4
[    0.218046] raid6: using avx2x2 recovery algorithm
[    0.218084] ACPI: Added _OSI(Module Device)
[    0.218084] ACPI: Added _OSI(Processor Device)
[    0.218085] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.218085] ACPI: Added _OSI(Processor Aggregator Device)
[    0.218086] ACPI: Added _OSI(Linux-Dell-Video)
[    0.218086] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.218087] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.224582] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.225436] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.227159] ACPI: Interpreter enabled
[    0.227170] ACPI: (supports S0 S3 S4 S5)
[    0.227171] ACPI: Using IOAPIC for interrupt routing
[    0.227385] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.227559] ACPI: Enabled 2 GPEs in block 00 to 1F
[    0.231837] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.231840] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.231938] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug PME LTR DPC]
[    0.232034] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug AER PCIeCapability]
[    0.232041] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
[    0.232228] PCI host bridge to bus 0000:00
[    0.232229] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.232230] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.232230] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    0.232231] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.232232] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.232232] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
[    0.232233] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2ffff window]
[    0.232234] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
[    0.232234] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.232242] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    0.232308] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
[    0.232388] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    0.232442] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
[    0.232923] pci 0000:00:01.3: enabling Extended Tags
[    0.233000] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.233115] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    0.233178] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    0.233227] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
[    0.234011] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.234125] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    0.234193] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    0.234242] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    0.234939] pci 0000:00:07.1: enabling Extended Tags
[    0.235012] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.235124] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    0.235173] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    0.235930] pci 0000:00:08.1: enabling Extended Tags
[    0.236011] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.236158] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    0.236365] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    0.236572] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    0.236608] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    0.236646] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    0.236682] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    0.236718] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    0.236753] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    0.236788] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    0.236824] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    0.238050] pci 0000:03:00.0: [1022:43d0] type 00 class 0x0c0330
[    0.238065] pci 0000:03:00.0: reg 0x10: [mem 0xfcca0000-0xfcca7fff 64bit]
[    0.238097] pci 0000:03:00.0: enabling Extended Tags
[    0.238143] pci 0000:03:00.0: PME# supported from D3hot D3cold
[    0.238225] pci 0000:03:00.1: [1022:43c8] type 00 class 0x010601
[    0.238264] pci 0000:03:00.1: reg 0x24: [mem 0xfcc80000-0xfcc9ffff]
[    0.238270] pci 0000:03:00.1: reg 0x30: [mem 0xfcc00000-0xfcc7ffff pref]
[    0.238275] pci 0000:03:00.1: enabling Extended Tags
[    0.238308] pci 0000:03:00.1: PME# supported from D3hot D3cold
[    0.238367] pci 0000:03:00.2: [1022:43c6] type 01 class 0x060400
[    0.238402] pci 0000:03:00.2: enabling Extended Tags
[    0.238439] pci 0000:03:00.2: PME# supported from D3hot D3cold
[    0.238523] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.238525] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.238526] pci 0000:00:01.3:   bridge window [mem 0xfca00000-0xfccfffff]
[    0.238594] pci 0000:20:00.0: [1022:43c7] type 01 class 0x060400
[    0.238633] pci 0000:20:00.0: enabling Extended Tags
[    0.238679] pci 0000:20:00.0: PME# supported from D3hot D3cold
[    0.238758] pci 0000:20:01.0: [1022:43c7] type 01 class 0x060400
[    0.238796] pci 0000:20:01.0: enabling Extended Tags
[    0.238843] pci 0000:20:01.0: PME# supported from D3hot D3cold
[    0.239016] pci 0000:20:02.0: [1022:43c7] type 01 class 0x060400
[    0.239055] pci 0000:20:02.0: enabling Extended Tags
[    0.239101] pci 0000:20:02.0: PME# supported from D3hot D3cold
[    0.239180] pci 0000:20:03.0: [1022:43c7] type 01 class 0x060400
[    0.239218] pci 0000:20:03.0: enabling Extended Tags
[    0.239264] pci 0000:20:03.0: PME# supported from D3hot D3cold
[    0.239345] pci 0000:20:04.0: [1022:43c7] type 01 class 0x060400
[    0.239384] pci 0000:20:04.0: enabling Extended Tags
[    0.239430] pci 0000:20:04.0: PME# supported from D3hot D3cold
[    0.239518] pci 0000:03:00.2: PCI bridge to [bus 20-25]
[    0.239522] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.239524] pci 0000:03:00.2:   bridge window [mem 0xfca00000-0xfcbfffff]
[    0.239554] pci 0000:20:00.0: PCI bridge to [bus 21]
[    0.239628] pci 0000:22:00.0: [8086:1539] type 00 class 0x020000
[    0.239657] pci 0000:22:00.0: reg 0x10: [mem 0xfcb00000-0xfcb1ffff]
[    0.239688] pci 0000:22:00.0: reg 0x18: [io  0xf000-0xf01f]
[    0.239704] pci 0000:22:00.0: reg 0x1c: [mem 0xfcb20000-0xfcb23fff]
[    0.239872] pci 0000:22:00.0: PME# supported from D0 D3hot D3cold
[    0.240018] pci 0000:20:01.0: PCI bridge to [bus 22]
[    0.240022] pci 0000:20:01.0:   bridge window [io  0xf000-0xffff]
[    0.240024] pci 0000:20:01.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    0.240060] pci 0000:20:02.0: PCI bridge to [bus 23]
[    0.240099] pci 0000:20:03.0: PCI bridge to [bus 24]
[    0.240162] pci 0000:25:00.0: [144d:a804] type 00 class 0x010802
[    0.240185] pci 0000:25:00.0: reg 0x10: [mem 0xfca00000-0xfca03fff 64bit]
[    0.240388] pci 0000:25:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:20:04.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    0.240454] pci 0000:20:04.0: PCI bridge to [bus 25]
[    0.240460] pci 0000:20:04.0:   bridge window [mem 0xfca00000-0xfcafffff]
[    0.241053] pci 0000:26:00.0: [1002:1478] type 01 class 0x060400
[    0.241063] pci 0000:26:00.0: reg 0x10: [mem 0xfce00000-0xfce03fff]
[    0.241138] pci 0000:26:00.0: PME# supported from D0 D3hot D3cold
[    0.241194] pci 0000:26:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:03.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
[    0.241239] pci 0000:00:03.1: PCI bridge to [bus 26-28]
[    0.241241] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.241243] pci 0000:00:03.1:   bridge window [mem 0xfcd00000-0xfcefffff]
[    0.241245] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.241283] pci 0000:27:00.0: [1002:1479] type 01 class 0x060400
[    0.241365] pci 0000:27:00.0: PME# supported from D0 D3hot D3cold
[    0.241449] pci 0000:26:00.0: PCI bridge to [bus 27-28]
[    0.241452] pci 0000:26:00.0:   bridge window [io  0xe000-0xefff]
[    0.241454] pci 0000:26:00.0:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.241458] pci 0000:26:00.0:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.241500] pci 0000:28:00.0: [1002:731f] type 00 class 0x030000
[    0.241513] pci 0000:28:00.0: reg 0x10: [mem 0xe0000000-0xefffffff 64bit pref]
[    0.241522] pci 0000:28:00.0: reg 0x18: [mem 0xf0000000-0xf01fffff 64bit pref]
[    0.241527] pci 0000:28:00.0: reg 0x20: [io  0xe000-0xe0ff]
[    0.241533] pci 0000:28:00.0: reg 0x24: [mem 0xfcd00000-0xfcd7ffff]
[    0.241539] pci 0000:28:00.0: reg 0x30: [mem 0xfcd80000-0xfcd9ffff pref]
[    0.241550] pci 0000:28:00.0: BAR 0: assigned to efifb
[    0.241608] pci 0000:28:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.241672] pci 0000:28:00.0: 126.016 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x16 link at 0000:00:03.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
[    0.241704] pci 0000:28:00.1: [1002:ab38] type 00 class 0x040300
[    0.241714] pci 0000:28:00.1: reg 0x10: [mem 0xfcda0000-0xfcda3fff]
[    0.241788] pci 0000:28:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.241878] pci 0000:27:00.0: PCI bridge to [bus 28]
[    0.241882] pci 0000:27:00.0:   bridge window [io  0xe000-0xefff]
[    0.241884] pci 0000:27:00.0:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.241887] pci 0000:27:00.0:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.241959] pci 0000:29:00.0: [1022:145a] type 00 class 0x130000
[    0.241978] pci 0000:29:00.0: enabling Extended Tags
[    0.242051] pci 0000:29:00.2: [1022:1456] type 00 class 0x108000
[    0.242061] pci 0000:29:00.2: reg 0x18: [mem 0xfc800000-0xfc8fffff]
[    0.242067] pci 0000:29:00.2: reg 0x24: [mem 0xfc900000-0xfc901fff]
[    0.242072] pci 0000:29:00.2: enabling Extended Tags
[    0.242142] pci 0000:29:00.3: [1022:145f] type 00 class 0x0c0330
[    0.242150] pci 0000:29:00.3: reg 0x10: [mem 0xfc700000-0xfc7fffff 64bit]
[    0.242166] pci 0000:29:00.3: enabling Extended Tags
[    0.242192] pci 0000:29:00.3: PME# supported from D0 D3hot D3cold
[    0.242249] pci 0000:00:07.1: PCI bridge to [bus 29]
[    0.242252] pci 0000:00:07.1:   bridge window [mem 0xfc700000-0xfc9fffff]
[    0.244039] pci 0000:2a:00.0: [1022:1455] type 00 class 0x130000
[    0.244060] pci 0000:2a:00.0: enabling Extended Tags
[    0.244128] pci 0000:2a:00.2: [1022:7901] type 00 class 0x010601
[    0.244150] pci 0000:2a:00.2: reg 0x24: [mem 0xfcf08000-0xfcf08fff]
[    0.244156] pci 0000:2a:00.2: enabling Extended Tags
[    0.244182] pci 0000:2a:00.2: PME# supported from D3hot D3cold
[    0.244239] pci 0000:2a:00.3: [1022:1457] type 00 class 0x040300
[    0.244245] pci 0000:2a:00.3: reg 0x10: [mem 0xfcf00000-0xfcf07fff]
[    0.244261] pci 0000:2a:00.3: enabling Extended Tags
[    0.244286] pci 0000:2a:00.3: PME# supported from D0 D3hot D3cold
[    0.244346] pci 0000:00:08.1: PCI bridge to [bus 2a]
[    0.244349] pci 0000:00:08.1:   bridge window [mem 0xfcf00000-0xfcffffff]
[    0.244512] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    0.244550] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    0.244582] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    0.244624] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    0.244660] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    0.244689] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    0.244718] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    0.244747] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    0.245207] iommu: Default domain type: Translated 
[    0.245207] pci 0000:28:00.0: vgaarb: setting as boot VGA device
[    0.245207] pci 0000:28:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.245207] pci 0000:28:00.0: vgaarb: bridge control possible
[    0.245207] vgaarb: loaded
[    0.245207] SCSI subsystem initialized
[    0.245207] libata version 3.00 loaded.
[    0.245207] ACPI: bus type USB registered
[    0.245207] usbcore: registered new interface driver usbfs
[    0.245207] usbcore: registered new interface driver hub
[    0.245207] usbcore: registered new device driver usb
[    0.245207] pps_core: LinuxPPS API ver. 1 registered
[    0.245207] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.245207] PTP clock support registered
[    0.245207] EDAC MC: Ver: 3.0.0
[    0.245207] Registered efivars operations
[    0.245207] NetLabel: Initializing
[    0.245207] NetLabel:  domain hash size = 128
[    0.245207] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.245207] NetLabel:  unlabeled traffic allowed by default
[    0.245207] PCI: Using ACPI for IRQ routing
[    0.248254] PCI: pci_cache_line_size set to 64 bytes
[    0.248313] Expanded resource Reserved due to conflict with PCI Bus 0000:00
[    0.248313] e820: reserve RAM buffer [mem 0x09d80000-0x0bffffff]
[    0.248314] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
[    0.248315] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
[    0.248315] e820: reserve RAM buffer [mem 0xd7fdb018-0xd7ffffff]
[    0.248316] e820: reserve RAM buffer [mem 0xd7ff5018-0xd7ffffff]
[    0.248316] e820: reserve RAM buffer [mem 0xd86fa000-0xdbffffff]
[    0.248316] e820: reserve RAM buffer [mem 0xdbc4b000-0xdbffffff]
[    0.248317] e820: reserve RAM buffer [mem 0xdbf3d000-0xdbffffff]
[    0.248317] e820: reserve RAM buffer [mem 0xdf000000-0xdfffffff]
[    0.248318] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
[    0.248320] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.248320] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.250035] clocksource: Switched to clocksource tsc-early
[    0.263442] VFS: Disk quotas dquot_6.6.0
[    0.263455] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.263506] pnp: PnP ACPI init
[    0.263604] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
[    0.263608] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.263661] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.263780] system 00:02: [io  0x0a00-0x0a0f] has been reserved
[    0.263781] system 00:02: [io  0x0a10-0x0a1f] has been reserved
[    0.263782] system 00:02: [io  0x0a20-0x0a2f] has been reserved
[    0.263782] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    0.263785] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.263936] system 00:03: [io  0x04d0-0x04d1] has been reserved
[    0.263937] system 00:03: [io  0x040b] has been reserved
[    0.263937] system 00:03: [io  0x04d6] has been reserved
[    0.263938] system 00:03: [io  0x0c00-0x0c01] has been reserved
[    0.263939] system 00:03: [io  0x0c14] has been reserved
[    0.263939] system 00:03: [io  0x0c50-0x0c51] has been reserved
[    0.263940] system 00:03: [io  0x0c52] has been reserved
[    0.263941] system 00:03: [io  0x0c6c] has been reserved
[    0.263941] system 00:03: [io  0x0c6f] has been reserved
[    0.263942] system 00:03: [io  0x0cd0-0x0cd1] has been reserved
[    0.263942] system 00:03: [io  0x0cd2-0x0cd3] has been reserved
[    0.263943] system 00:03: [io  0x0cd4-0x0cd5] has been reserved
[    0.263944] system 00:03: [io  0x0cd6-0x0cd7] has been reserved
[    0.263944] system 00:03: [io  0x0cd8-0x0cdf] has been reserved
[    0.263945] system 00:03: [io  0x0800-0x089f] has been reserved
[    0.263945] system 00:03: [io  0x0b00-0x0b0f] has been reserved
[    0.263946] system 00:03: [io  0x0b20-0x0b3f] has been reserved
[    0.263947] system 00:03: [io  0x0900-0x090f] has been reserved
[    0.263947] system 00:03: [io  0x0910-0x091f] has been reserved
[    0.263948] system 00:03: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.263949] system 00:03: [mem 0xfec01000-0xfec01fff] could not be reserved
[    0.263950] system 00:03: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    0.263951] system 00:03: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.263951] system 00:03: [mem 0xfed80000-0xfed8ffff] could not be reserved
[    0.263952] system 00:03: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.263953] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
[    0.263955] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.264225] pnp: PnP ACPI: found 4 devices
[    0.269582] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.269627] NET: Registered protocol family 2
[    0.269801] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.269828] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.270051] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes, linear)
[    0.270150] TCP: Hash tables configured (established 262144 bind 65536)
[    0.270273] MPTCP token hash table entries: 32768 (order: 7, 786432 bytes, linear)
[    0.270313] UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    0.270353] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    0.270439] NET: Registered protocol family 1
[    0.270443] NET: Registered protocol family 44
[    0.270455] pci 0000:20:00.0: PCI bridge to [bus 21]
[    0.270465] pci 0000:20:01.0: PCI bridge to [bus 22]
[    0.270467] pci 0000:20:01.0:   bridge window [io  0xf000-0xffff]
[    0.270470] pci 0000:20:01.0:   bridge window [mem 0xfcb00000-0xfcbfffff]
[    0.270476] pci 0000:20:02.0: PCI bridge to [bus 23]
[    0.270484] pci 0000:20:03.0: PCI bridge to [bus 24]
[    0.270492] pci 0000:20:04.0: PCI bridge to [bus 25]
[    0.270496] pci 0000:20:04.0:   bridge window [mem 0xfca00000-0xfcafffff]
[    0.270501] pci 0000:03:00.2: PCI bridge to [bus 20-25]
[    0.270503] pci 0000:03:00.2:   bridge window [io  0xf000-0xffff]
[    0.270505] pci 0000:03:00.2:   bridge window [mem 0xfca00000-0xfcbfffff]
[    0.270511] pci 0000:00:01.3: PCI bridge to [bus 03-25]
[    0.270512] pci 0000:00:01.3:   bridge window [io  0xf000-0xffff]
[    0.270514] pci 0000:00:01.3:   bridge window [mem 0xfca00000-0xfccfffff]
[    0.270517] pci 0000:27:00.0: PCI bridge to [bus 28]
[    0.270519] pci 0000:27:00.0:   bridge window [io  0xe000-0xefff]
[    0.270521] pci 0000:27:00.0:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.270523] pci 0000:27:00.0:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270527] pci 0000:26:00.0: PCI bridge to [bus 27-28]
[    0.270528] pci 0000:26:00.0:   bridge window [io  0xe000-0xefff]
[    0.270531] pci 0000:26:00.0:   bridge window [mem 0xfcd00000-0xfcdfffff]
[    0.270533] pci 0000:26:00.0:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270537] pci 0000:00:03.1: PCI bridge to [bus 26-28]
[    0.270537] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
[    0.270539] pci 0000:00:03.1:   bridge window [mem 0xfcd00000-0xfcefffff]
[    0.270540] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270543] pci 0000:00:07.1: PCI bridge to [bus 29]
[    0.270545] pci 0000:00:07.1:   bridge window [mem 0xfc700000-0xfc9fffff]
[    0.270548] pci 0000:00:08.1: PCI bridge to [bus 2a]
[    0.270549] pci 0000:00:08.1:   bridge window [mem 0xfcf00000-0xfcffffff]
[    0.270553] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.270554] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.270555] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[    0.270555] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[    0.270556] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
[    0.270557] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
[    0.270557] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xfec2ffff window]
[    0.270558] pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff window]
[    0.270558] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    0.270559] pci_bus 0000:03: resource 1 [mem 0xfca00000-0xfccfffff]
[    0.270559] pci_bus 0000:20: resource 0 [io  0xf000-0xffff]
[    0.270560] pci_bus 0000:20: resource 1 [mem 0xfca00000-0xfcbfffff]
[    0.270561] pci_bus 0000:22: resource 0 [io  0xf000-0xffff]
[    0.270561] pci_bus 0000:22: resource 1 [mem 0xfcb00000-0xfcbfffff]
[    0.270562] pci_bus 0000:25: resource 1 [mem 0xfca00000-0xfcafffff]
[    0.270562] pci_bus 0000:26: resource 0 [io  0xe000-0xefff]
[    0.270563] pci_bus 0000:26: resource 1 [mem 0xfcd00000-0xfcefffff]
[    0.270564] pci_bus 0000:26: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270564] pci_bus 0000:27: resource 0 [io  0xe000-0xefff]
[    0.270565] pci_bus 0000:27: resource 1 [mem 0xfcd00000-0xfcdfffff]
[    0.270565] pci_bus 0000:27: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270566] pci_bus 0000:28: resource 0 [io  0xe000-0xefff]
[    0.270566] pci_bus 0000:28: resource 1 [mem 0xfcd00000-0xfcdfffff]
[    0.270567] pci_bus 0000:28: resource 2 [mem 0xe0000000-0xf01fffff 64bit pref]
[    0.270567] pci_bus 0000:29: resource 1 [mem 0xfc700000-0xfc9fffff]
[    0.270568] pci_bus 0000:2a: resource 1 [mem 0xfcf00000-0xfcffffff]
[    0.270730] pci 0000:28:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.270745] pci 0000:28:00.1: D0 power state depends on 0000:28:00.0
[    0.270877] PCI: CLS 64 bytes, default 64
[    0.270905] Trying to unpack rootfs image as initramfs...
[    0.639631] Freeing initrd memory: 42088K
[    0.639656] pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.639705] pci 0000:00:01.0: Adding to iommu group 0
[    0.639714] pci 0000:00:01.3: Adding to iommu group 1
[    0.639723] pci 0000:00:02.0: Adding to iommu group 2
[    0.639736] pci 0000:00:03.0: Adding to iommu group 3
[    0.639743] pci 0000:00:03.1: Adding to iommu group 4
[    0.639752] pci 0000:00:04.0: Adding to iommu group 5
[    0.639762] pci 0000:00:07.0: Adding to iommu group 6
[    0.639771] pci 0000:00:07.1: Adding to iommu group 7
[    0.639781] pci 0000:00:08.0: Adding to iommu group 8
[    0.639788] pci 0000:00:08.1: Adding to iommu group 9
[    0.639801] pci 0000:00:14.0: Adding to iommu group 10
[    0.639807] pci 0000:00:14.3: Adding to iommu group 10
[    0.639842] pci 0000:00:18.0: Adding to iommu group 11
[    0.639849] pci 0000:00:18.1: Adding to iommu group 11
[    0.639855] pci 0000:00:18.2: Adding to iommu group 11
[    0.639861] pci 0000:00:18.3: Adding to iommu group 11
[    0.639868] pci 0000:00:18.4: Adding to iommu group 11
[    0.639875] pci 0000:00:18.5: Adding to iommu group 11
[    0.639881] pci 0000:00:18.6: Adding to iommu group 11
[    0.639888] pci 0000:00:18.7: Adding to iommu group 11
[    0.639905] pci 0000:03:00.0: Adding to iommu group 12
[    0.639913] pci 0000:03:00.1: Adding to iommu group 12
[    0.639921] pci 0000:03:00.2: Adding to iommu group 12
[    0.639924] pci 0000:20:00.0: Adding to iommu group 12
[    0.639926] pci 0000:20:01.0: Adding to iommu group 12
[    0.639929] pci 0000:20:02.0: Adding to iommu group 12
[    0.639933] pci 0000:20:03.0: Adding to iommu group 12
[    0.639936] pci 0000:20:04.0: Adding to iommu group 12
[    0.639939] pci 0000:22:00.0: Adding to iommu group 12
[    0.639942] pci 0000:25:00.0: Adding to iommu group 12
[    0.639950] pci 0000:26:00.0: Adding to iommu group 13
[    0.639957] pci 0000:27:00.0: Adding to iommu group 14
[    0.639980] pci 0000:28:00.0: Adding to iommu group 15
[    0.639990] pci 0000:28:00.1: Adding to iommu group 16
[    0.639998] pci 0000:29:00.0: Adding to iommu group 17
[    0.640006] pci 0000:29:00.2: Adding to iommu group 18
[    0.640015] pci 0000:29:00.3: Adding to iommu group 19
[    0.640023] pci 0000:2a:00.0: Adding to iommu group 20
[    0.640031] pci 0000:2a:00.2: Adding to iommu group 21
[    0.640039] pci 0000:2a:00.3: Adding to iommu group 22
[    0.643528] pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
[    0.643529] pci 0000:00:00.2: AMD-Vi: Extended features (0xf77ef22294ada):
[    0.643530]  PPR NX GT IA GA PC GA_vAPIC
[    0.643532] AMD-Vi: Interrupt remapping enabled
[    0.643532] AMD-Vi: Virtual APIC enabled
[    0.643618] AMD-Vi: Lazy IO/TLB flushing enabled
[    0.644593] amd_uncore: AMD NB counters detected
[    0.644598] amd_uncore: AMD LLC counters detected
[    0.644785] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.645873] Initialise system trusted keyrings
[    0.645883] Key type blacklist registered
[    0.645911] workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.646656] zbud: loaded
[    0.646973] integrity: Platform Keyring initialized
[    0.654347] NET: Registered protocol family 38
[    0.654348] Key type asymmetric registered
[    0.654349] Asymmetric key parser 'x509' registered
[    0.654353] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.654396] io scheduler mq-deadline registered
[    0.654397] io scheduler kyber registered
[    0.654411] io scheduler bfq registered
[    0.654524] atomic64_test: passed for x86-64 platform with CX8 and with SSE
[    0.654865] pcieport 0000:00:01.3: AER: enabled with IRQ 26
[    0.655736] pcieport 0000:00:03.1: AER: enabled with IRQ 27
[    0.656626] pcieport 0000:00:07.1: AER: enabled with IRQ 28
[    0.656857] pcieport 0000:00:08.1: AER: enabled with IRQ 30
[    0.658413] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.658425] efifb: probing for efifb
[    0.658437] efifb: No BGRT, not showing boot graphics
[    0.658438] efifb: framebuffer at 0xe0000000, using 3072k, total 3072k
[    0.658438] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    0.658438] efifb: scrolling: redraw
[    0.658439] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.658464] fbcon: Deferring console take-over
[    0.658465] fb0: EFI VGA frame buffer device
[    0.658545] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    0.658560] ACPI: Power Button [PWRB]
[    0.658579] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.658601] ACPI: Power Button [PWRF]
[    0.658634] Monitor-Mwait will be used to enter C-1 state
[    0.658640] ACPI: \_PR_.C000: Found 2 idle states
[    0.658737] ACPI: \_PR_.C002: Found 2 idle states
[    0.658827] ACPI: \_PR_.C004: Found 2 idle states
[    0.658886] ACPI: \_PR_.C006: Found 2 idle states
[    0.658956] ACPI: \_PR_.C008: Found 2 idle states
[    0.659026] ACPI: \_PR_.C00A: Found 2 idle states
[    0.659073] ACPI: \_PR_.C00C: Found 2 idle states
[    0.659125] ACPI: \_PR_.C00E: Found 2 idle states
[    0.659203] ACPI: \_PR_.C001: Found 2 idle states
[    0.659276] ACPI: \_PR_.C003: Found 2 idle states
[    0.659343] ACPI: \_PR_.C005: Found 2 idle states
[    0.659409] ACPI: \_PR_.C007: Found 2 idle states
[    0.659494] ACPI: \_PR_.C009: Found 2 idle states
[    0.659549] ACPI: \_PR_.C00B: Found 2 idle states
[    0.659598] ACPI: \_PR_.C00D: Found 2 idle states
[    0.659661] ACPI: \_PR_.C00F: Found 2 idle states
[    0.659835] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.660693] Non-volatile memory driver v1.3
[    0.660706] Linux agpgart interface v0.103
[    0.661497] ahci 0000:03:00.1: version 3.0
[    0.661572] ahci 0000:03:00.1: SSS flag set, parallel bus scan disabled
[    0.661622] ahci 0000:03:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[    0.661623] ahci 0000:03:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
[    0.662023] scsi host0: ahci
[    0.662106] scsi host1: ahci
[    0.662171] scsi host2: ahci
[    0.662226] scsi host3: ahci
[    0.662280] scsi host4: ahci
[    0.662333] scsi host5: ahci
[    0.662390] scsi host6: ahci
[    0.662445] scsi host7: ahci
[    0.662467] ata1: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80100 irq 43
[    0.662468] ata2: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80180 irq 43
[    0.662469] ata3: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80200 irq 43
[    0.662470] ata4: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80280 irq 43
[    0.662471] ata5: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80300 irq 43
[    0.662473] ata6: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80380 irq 43
[    0.662474] ata7: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80400 irq 43
[    0.662475] ata8: SATA max UDMA/133 abar m131072@0xfcc80000 port 0xfcc80480 irq 43
[    0.662566] ahci 0000:2a:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    0.662567] ahci 0000:2a:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
[    0.662660] scsi host8: ahci
[    0.662683] ata9: SATA max UDMA/133 abar m4096@0xfcf08000 port 0xfcf08100 irq 45
[    0.662757] libphy: Fixed MDIO Bus: probed
[    0.662803] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.662805] ehci-pci: EHCI PCI platform driver
[    0.662811] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.662821] ohci-pci: OHCI PCI platform driver
[    0.662827] uhci_hcd: USB Universal Host Controller Interface driver
[    0.662874] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.662893] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 1
[    0.718188] xhci_hcd 0000:03:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
[    0.718464] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
[    0.718465] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.718466] usb usb1: Product: xHCI Host Controller
[    0.718467] usb usb1: Manufacturer: Linux 5.9.0-36.fc34.x86_64 xhci-hcd
[    0.718467] usb usb1: SerialNumber: 0000:03:00.0
[    0.718523] hub 1-0:1.0: USB hub found
[    0.718537] hub 1-0:1.0: 14 ports detected
[    0.718774] xhci_hcd 0000:03:00.0: xHCI Host Controller
[    0.718790] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 2
[    0.718792] xhci_hcd 0000:03:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    0.718844] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    0.718855] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.09
[    0.718855] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.718856] usb usb2: Product: xHCI Host Controller
[    0.718857] usb usb2: Manufacturer: Linux 5.9.0-36.fc34.x86_64 xhci-hcd
[    0.718857] usb usb2: SerialNumber: 0000:03:00.0
[    0.718902] hub 2-0:1.0: USB hub found
[    0.718911] hub 2-0:1.0: 8 ports detected
[    0.719083] xhci_hcd 0000:29:00.3: xHCI Host Controller
[    0.719103] xhci_hcd 0000:29:00.3: new USB bus registered, assigned bus number 3
[    0.719191] xhci_hcd 0000:29:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000000000410
[    0.719414] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.09
[    0.719415] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.719416] usb usb3: Product: xHCI Host Controller
[    0.719416] usb usb3: Manufacturer: Linux 5.9.0-36.fc34.x86_64 xhci-hcd
[    0.719417] usb usb3: SerialNumber: 0000:29:00.3
[    0.719460] hub 3-0:1.0: USB hub found
[    0.719464] hub 3-0:1.0: 4 ports detected
[    0.719554] xhci_hcd 0000:29:00.3: xHCI Host Controller
[    0.719569] xhci_hcd 0000:29:00.3: new USB bus registered, assigned bus number 4
[    0.719572] xhci_hcd 0000:29:00.3: Host supports USB 3.0 SuperSpeed
[    0.719581] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    0.719591] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.09
[    0.719592] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    0.719593] usb usb4: Product: xHCI Host Controller
[    0.719593] usb usb4: Manufacturer: Linux 5.9.0-36.fc34.x86_64 xhci-hcd
[    0.719594] usb usb4: SerialNumber: 0000:29:00.3
[    0.719636] hub 4-0:1.0: USB hub found
[    0.719641] hub 4-0:1.0: 4 ports detected
[    0.719737] usbcore: registered new interface driver usbserial_generic
[    0.719739] usbserial: USB Serial support registered for generic
[    0.719749] i8042: PNP: No PS/2 controller found.
[    0.719767] mousedev: PS/2 mouse device common for all mice
[    0.719830] rtc_cmos 00:01: RTC can wake from S4
[    0.720104] rtc_cmos 00:01: registered as rtc0
[    0.720181] rtc_cmos 00:01: setting system clock to 2020-10-16T04:32:07 UTC (1602822727)
[    0.720182] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.720204] device-mapper: uevent: version 1.0.3
[    0.720230] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    0.720418] hid: raw HID events driver (C) Jiri Kosina
[    0.720435] usbcore: registered new interface driver usbhid
[    0.720435] usbhid: USB HID core driver
[    0.720495] drop_monitor: Initializing network drop monitor service
[    0.720538] Initializing XFRM netlink socket
[    0.720605] NET: Registered protocol family 10
[    0.722488] Segment Routing with IPv6
[    0.722489] RPL Segment Routing with IPv6
[    0.722500] mip6: Mobile IPv6
[    0.722500] NET: Registered protocol family 17
[    0.723130] microcode: CPU0: patch_level=0x0800820d
[    0.723135] microcode: CPU1: patch_level=0x0800820d
[    0.723141] microcode: CPU2: patch_level=0x0800820d
[    0.723146] microcode: CPU3: patch_level=0x0800820d
[    0.723152] microcode: CPU4: patch_level=0x0800820d
[    0.723157] microcode: CPU5: patch_level=0x0800820d
[    0.723161] microcode: CPU6: patch_level=0x0800820d
[    0.723166] microcode: CPU7: patch_level=0x0800820d
[    0.723171] microcode: CPU8: patch_level=0x0800820d
[    0.723175] microcode: CPU9: patch_level=0x0800820d
[    0.723181] microcode: CPU10: patch_level=0x0800820d
[    0.723186] microcode: CPU11: patch_level=0x0800820d
[    0.723190] microcode: CPU12: patch_level=0x0800820d
[    0.723194] microcode: CPU13: patch_level=0x0800820d
[    0.723196] microcode: CPU14: patch_level=0x0800820d
[    0.723199] microcode: CPU15: patch_level=0x0800820d
[    0.723201] microcode: Microcode Update Driver: v2.2.
[    0.723203] IPI shorthand broadcast: enabled
[    0.723207] AVX2 version of gcm_enc/dec engaged.
[    0.723207] AES CTR mode by8 optimization enabled
[    0.732173] sched_clock: Marking stable (744164418, -11996620)->(1011588074, -279420276)
[    0.732282] registered taskstats version 1
[    0.732290] Loading compiled-in X.509 certificates
[    0.732724] Loaded X.509 cert 'Fedora kernel signing key: c1cf65b0a83c8aa3fb2d2315bfbd3283c8d43266'
[    0.732742] zswap: loaded using pool lzo/zbud
[    0.732931] Key type ._fscrypt registered
[    0.732932] Key type .fscrypt registered
[    0.732932] Key type fscrypt-provisioning registered
[    0.733048] Btrfs loaded, crc32c=crc32c-generic
[    0.734429] Key type encrypted registered
[    0.734645] ima: No TPM chip found, activating TPM-bypass!
[    0.734650] ima: Allocated hash algorithm: sha256
[    0.734657] ima: No architecture policies found
[    0.734917] PM:   Magic number: 8:127:515
[    0.735023] RAS: Correctable Errors collector initialized.
[    0.970053] ata1: SATA link down (SStatus 0 SControl 300)
[    0.970076] ata9: SATA link down (SStatus 0 SControl 300)
[    1.045882] usb 4-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    1.072251] usb 4-1: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.17
[    1.072252] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.072252] usb 4-1: Product: 4-Port USB 3.0 Hub
[    1.072253] usb 4-1: Manufacturer: Generic
[    1.099009] usb 1-2: new high-speed USB device number 2 using xhci_hcd
[    1.107256] hub 4-1:1.0: USB hub found
[    1.108635] hub 4-1:1.0: 4 ports detected
[    1.178482] usb 3-1: new high-speed USB device number 2 using xhci_hcd
[    1.283704] ata2: SATA link down (SStatus 0 SControl 300)
[    1.303596] usb 1-2: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.00
[    1.303597] usb 1-2: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    1.303599] usb 1-2: Product: USB 2.0 Hub [MTT]
[    1.309557] hub 1-2:1.0: USB hub found
[    1.312542] hub 1-2:1.0: 4 ports detected
[    1.321772] usb 3-1: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.17
[    1.321773] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.321774] usb 3-1: Product: 4-Port USB 2.0 Hub
[    1.321774] usb 3-1: Manufacturer: Generic
[    1.360703] hub 3-1:1.0: USB hub found
[    1.362347] hub 3-1:1.0: 4 ports detected
[    1.508039] usb 1-11: new full-speed USB device number 3 using xhci_hcd
[    1.593145] ata3: SATA link down (SStatus 0 SControl 300)
[    1.683507] tsc: Refined TSC clocksource calibration: 3699.996 MHz
[    1.683516] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6aaaa371c79, max_idle_ns: 881590671907 ns
[    1.683560] clocksource: Switched to clocksource tsc
[    1.878486] usb 1-11: New USB device found, idVendor=1b1c, idProduct=0c04, bcdDevice= 2.00
[    1.878488] usb 1-11: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    1.878490] usb 1-11: Product: Integrated USB Bridge
[    1.878491] usb 1-11: Manufacturer: Corsair Memory, Inc.
[    1.890557] hid-generic 0003:1B1C:0C04.0001: hiddev96,hidraw0: USB HID v1.11 Device [Corsair Memory, Inc. Integrated USB Bridge] on usb-0000:03:00.0-11/input0
[    1.906096] ata4: SATA link down (SStatus 0 SControl 300)
[    1.955398] usb 1-2.1: new high-speed USB device number 4 using xhci_hcd
[    2.151733] usb 1-2.1: New USB device found, idVendor=13fd, idProduct=160f, bcdDevice= 1.00
[    2.151735] usb 1-2.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.216201] ata5: SATA link down (SStatus 0 SControl 300)
[    2.321393] usb 1-12: new full-speed USB device number 5 using xhci_hcd
[    2.683384] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    2.683693] ata6.00: supports DRM functions and may not be fully accessible
[    2.684496] ata6.00: ATA-11: Samsung SSD 860 EVO 1TB, RVT01B6Q, max UDMA/133
[    2.684497] ata6.00: 1953525168 sectors, multi 1: LBA48 NCQ (depth 32), AA
[    2.686754] ata6.00: supports DRM functions and may not be fully accessible
[    2.689416] ata6.00: configured for UDMA/133
[    2.689821] scsi 5:0:0:0: Direct-Access     ATA      Samsung SSD 860  1B6Q PQ: 0 ANSI: 5
[    2.689913] ata6.00: Enabling discard_zeroes_data
[    2.689935] sd 5:0:0:0: [sda] 1953525168 512-byte logical blocks: (1.00 TB/932 GiB)
[    2.689939] sd 5:0:0:0: [sda] Write Protect is off
[    2.689940] sd 5:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.689946] sd 5:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.689955] sd 5:0:0:0: Attached scsi generic sg0 type 0
[    2.690141] ata6.00: Enabling discard_zeroes_data
[    2.691389]  sda: sda1 sda2
[    2.691704] ata6.00: Enabling discard_zeroes_data
[    2.692764] sd 5:0:0:0: [sda] supports TCG Opal
[    2.692765] sd 5:0:0:0: [sda] Attached SCSI disk
[    2.695299] usb 1-12: New USB device found, idVendor=1532, idProduct=0228, bcdDevice= 2.00
[    2.695300] usb 1-12: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.695302] usb 1-12: Product: Razer BlackWidow Elite
[    2.695303] usb 1-12: Manufacturer: Razer
[    2.719499] input: Razer Razer BlackWidow Elite as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.0/0003:1532:0228.0002/input/input2
[    2.771401] usb 1-2.2: new high-speed USB device number 6 using xhci_hcd
[    2.771548] hid-generic 0003:1532:0228.0002: input,hidraw1: USB HID v1.11 Keyboard [Razer Razer BlackWidow Elite] on usb-0000:03:00.0-12/input0
[    2.780714] input: Razer Razer BlackWidow Elite Keyboard as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.1/0003:1532:0228.0003/input/input3
[    2.832508] input: Razer Razer BlackWidow Elite Consumer Control as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.1/0003:1532:0228.0003/input/input4
[    2.832546] input: Razer Razer BlackWidow Elite System Control as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.1/0003:1532:0228.0003/input/input5
[    2.832582] input: Razer Razer BlackWidow Elite as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.1/0003:1532:0228.0003/input/input6
[    2.832621] hid-generic 0003:1532:0228.0003: input,hidraw2: USB HID v1.11 Keyboard [Razer Razer BlackWidow Elite] on usb-0000:03:00.0-12/input1
[    2.840557] input: Razer Razer BlackWidow Elite as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-12/1-12:1.2/0003:1532:0228.0004/input/input7
[    2.840791] hid-generic 0003:1532:0228.0004: input,hidraw3: USB HID v1.11 Mouse [Razer Razer BlackWidow Elite] on usb-0000:03:00.0-12/input2
[    2.980823] usb 1-2.2: New USB device found, idVendor=058f, idProduct=6364, bcdDevice= 1.00
[    2.980825] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    2.980826] usb 1-2.2: Product: Mass Storage Device
[    2.980827] usb 1-2.2: Manufacturer: Generic
[    2.980828] usb 1-2.2: SerialNumber: 058F63646476
[    3.000299] ata7: SATA link down (SStatus 0 SControl 300)
[    3.008141] hid-generic 0003:058F:6364.0005: hiddev97,hidraw4: USB HID v1.10 Device [Generic Mass Storage Device] on usb-0000:03:00.0-2.2/input1
[    3.138399] usb 1-13: new full-speed USB device number 7 using xhci_hcd
[    3.309286] ata8: SATA link down (SStatus 0 SControl 300)
[    3.310486] Freeing unused decrypted memory: 2040K
[    3.310788] Freeing unused kernel image (initmem) memory: 2512K
[    3.310790] Write protecting the kernel read-only data: 26624k
[    3.311246] Freeing unused kernel image (text/rodata gap) memory: 2044K
[    3.311496] Freeing unused kernel image (rodata/data gap) memory: 1500K
[    3.338340] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.338343] rodata_test: all tests were successful
[    3.338347] Run /init as init process
[    3.338348]   with arguments:
[    3.338348]     /init
[    3.338349]     rhgb
[    3.338349]   with environment:
[    3.338349]     HOME=/
[    3.338349]     TERM=linux
[    3.338350]     BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.9.0-36.fc34.x86_64
[    3.348021] systemd[1]: systemd v246.6-3.fc33 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
[    3.360045] systemd[1]: Detected architecture x86-64.
[    3.360046] systemd[1]: Running in initial RAM disk.
[    3.360063] systemd[1]: Set hostname to <wopr>.
[    3.392483] systemd[1]: /usr/lib/systemd/system/memstrack.service:12: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.392488] systemd[1]: /usr/lib/systemd/system/memstrack.service:13: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.396313] systemd[1]: /usr/lib/systemd/system/plymouth-start.service:15: Unit configured to use KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update your service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.
[    3.398350] systemd[1]: /usr/lib/systemd/system/dracut-pre-udev.service:27: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.398353] systemd[1]: /usr/lib/systemd/system/dracut-pre-udev.service:28: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.398526] systemd[1]: /usr/lib/systemd/system/dracut-pre-trigger.service:23: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.398529] systemd[1]: /usr/lib/systemd/system/dracut-pre-trigger.service:24: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.398724] systemd[1]: /usr/lib/systemd/system/dracut-pre-pivot.service:30: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.398727] systemd[1]: /usr/lib/systemd/system/dracut-pre-pivot.service:31: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.399497] systemd[1]: /usr/lib/systemd/system/dracut-pre-mount.service:22: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.399500] systemd[1]: /usr/lib/systemd/system/dracut-pre-mount.service:23: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.399671] systemd[1]: /usr/lib/systemd/system/dracut-mount.service:22: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.399674] systemd[1]: /usr/lib/systemd/system/dracut-mount.service:23: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.399798] systemd[1]: /usr/lib/systemd/system/dracut-initqueue.service:24: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.399801] systemd[1]: /usr/lib/systemd/system/dracut-initqueue.service:25: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.399934] systemd[1]: /usr/lib/systemd/system/dracut-cmdline.service:26: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[    3.399937] systemd[1]: /usr/lib/systemd/system/dracut-cmdline.service:27: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[    3.401709] systemd[1]: Queued start job for default target Initrd Default Target.
[    3.401779] systemd[1]: Reached target Local File Systems.
[    3.401810] systemd[1]: Reached target Slices.
[    3.401820] systemd[1]: Reached target Swap.
[    3.401828] systemd[1]: Reached target Timers.
[    3.401899] systemd[1]: Listening on Journal Audit Socket.
[    3.401944] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.401994] systemd[1]: Listening on Journal Socket.
[    3.402049] systemd[1]: Listening on udev Control Socket.
[    3.402087] systemd[1]: Listening on udev Kernel Socket.
[    3.402096] systemd[1]: Reached target Sockets.
[    3.402975] systemd[1]: Starting Create list of static device nodes for the current kernel...
[    3.403368] systemd[1]: Started Memstrack Anylazing Service.
[    3.403847] systemd[1]: Started Hardware RNG Entropy Gatherer Daemon.
[    3.405029] systemd[1]: Starting Journal Service...
[    3.405488] systemd[1]: Starting Load Kernel Modules...
[    3.406010] systemd[1]: Starting Setup Virtual Console...
[    3.406306] systemd[1]: Finished Create list of static device nodes for the current kernel.
[    3.406817] systemd[1]: Starting Create Static Device Nodes in /dev...
[    3.411014] systemd[1]: Finished Create Static Device Nodes in /dev.
[    3.412280] systemd[1]: memstrack.service: Succeeded.
[    3.450864] fuse: init (API version 7.31)
[    3.451568] systemd[1]: Finished Load Kernel Modules.
[    3.451599] audit: type=1130 audit(1602822730.230:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.452251] systemd[1]: Starting Apply Kernel Variables...
[    3.456946] systemd[1]: Finished Apply Kernel Variables.
[    3.456973] audit: type=1130 audit(1602822730.235:3): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.461206] systemd[1]: Started Journal Service.
[    3.461246] audit: type=1130 audit(1602822730.240:4): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.463522] audit: type=1130 audit(1602822730.242:5): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-vconsole-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.467437] audit: type=1130 audit(1602822730.246:6): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-tmpfiles-setup comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.476185] audit: type=1130 audit(1602822730.255:7): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline-ask comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.498542] audit: type=1130 audit(1602822730.277:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-cmdline comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.511635] usb 1-13: New USB device found, idVendor=1050, idProduct=0407, bcdDevice= 5.12
[    3.511636] usb 1-13: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.511638] usb 1-13: Product: YubiKey OTP+FIDO+CCID
[    3.511639] usb 1-13: Manufacturer: Yubico
[    3.511654] audit: type=1130 audit(1602822730.290:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-pre-udev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[    3.512307] audit: type=1334 audit(1602822730.291:10): prog-id=6 op=LOAD
[    3.549549] input: Yubico YubiKey OTP+FIDO+CCID as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-13/1-13:1.0/0003:1050:0407.0006/input/input8
[    3.598404] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:02)
[    3.601160] hid-generic 0003:1050:0407.0006: input,hidraw5: USB HID v1.10 Keyboard [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:03:00.0-13/input0
[    3.604526] hid-generic 0003:1050:0407.0007: hiddev98,hidraw6: USB HID v1.10 Device [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:03:00.0-13/input1
[    3.626028] usb-storage 1-2.2:1.0: USB Mass Storage device detected
[    3.626155] scsi host9: usb-storage 1-2.2:1.0
[    3.626227] usbcore: registered new interface driver usb-storage
[    3.626331] ccp 0000:29:00.2: enabling device (0000 -> 0002)
[    3.626606] ccp 0000:29:00.2: ccp enabled
[    3.628239] usbcore: registered new interface driver uas
[    3.628553] dca service started, version 1.12.1
[    3.631124] nvme nvme0: pci function 0000:25:00.0
[    3.643718] igb: Intel(R) Gigabit Ethernet Network Driver
[    3.643718] igb: Copyright (c) 2007-2014 Intel Corporation.
[    3.643810] nvme nvme0: 7/0/0 default/read/poll queues
[    3.651083]  nvme0n1: p1 p2 p3
[    3.671545] pps pps0: new PPS source ptp0
[    3.671573] igb 0000:22:00.0: added PHC on eth0
[    3.671574] igb 0000:22:00.0: Intel(R) Gigabit Ethernet Network Connection
[    3.671575] igb 0000:22:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 30:9c:23:af:57:9e
[    3.671576] igb 0000:22:00.0: eth0: PBA No: FFFFFF-0FF
[    3.671577] igb 0000:22:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
[    3.674656] igb 0000:22:00.0 enp34s0: renamed from eth0
[    3.682938] BTRFS: device label fedora devid 1 transid 49676 /dev/nvme0n1p3 scanned by systemd-udevd (480)
[    3.704298] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    3.925394] [drm] amdgpu kernel modesetting enabled.
[    3.925442] amdgpu: Ignoring ACPI CRAT on non-APU system
[    3.925445] Virtual CRAT table created for CPU
[    3.925452] amdgpu: Topology: Add CPU node
[    3.925525] checking generic (e0000000 300000) vs hw (e0000000 10000000)
[    3.925525] fb0: switching to amdgpudrmfb from EFI VGA
[    3.925564] amdgpu 0000:28:00.0: vgaarb: deactivate vga console
[    3.925644] [drm] initializing kernel modesetting (NAVI10 0x1002:0x731F 0x1DA2:0xE409 0xC1).
[    3.925645] amdgpu 0000:28:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[    3.925651] [drm] register mmio base: 0xFCD00000
[    3.925652] [drm] register mmio size: 524288
[    3.926738] [drm] add ip block number 0 <nv_common>
[    3.926739] [drm] add ip block number 1 <gmc_v10_0>
[    3.926739] [drm] add ip block number 2 <navi10_ih>
[    3.926739] [drm] add ip block number 3 <psp>
[    3.926740] [drm] add ip block number 4 <smu>
[    3.926740] [drm] add ip block number 5 <dm>
[    3.926741] [drm] add ip block number 6 <gfx_v10_0>
[    3.926741] [drm] add ip block number 7 <sdma_v5_0>
[    3.926742] [drm] add ip block number 8 <vcn_v2_0>
[    3.926742] [drm] add ip block number 9 <jpeg_v2_0>
[    3.926753] amdgpu 0000:28:00.0: No more image in the PCI ROM
[    3.926772] amdgpu: ATOM BIOS: 113-D1990101-X02
[    3.926780] [drm] VCN decode is enabled in VM mode
[    3.926780] [drm] VCN encode is enabled in VM mode
[    3.926780] [drm] JPEG decode is enabled in VM mode
[    3.926797] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    3.926803] amdgpu 0000:28:00.0: amdgpu: VRAM: 8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
[    3.926804] amdgpu 0000:28:00.0: amdgpu: GART: 512M 0x0000000000000000 - 0x000000001FFFFFFF
[    3.926810] [drm] Detected VRAM RAM=8176M, BAR=256M
[    3.926811] [drm] RAM width 256bits GDDR6
[    3.926848] [TTM] Zone  kernel: Available graphics memory: 16444964 KiB
[    3.926849] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    3.926849] [TTM] Initializing pool allocator
[    3.926852] [TTM] Initializing DMA pool allocator
[    3.926882] [drm] amdgpu: 8176M of VRAM memory ready
[    3.926885] [drm] amdgpu: 8176M of GTT memory ready.
[    3.926886] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    3.926991] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
[    3.928658] [drm] Found VCN firmware Version ENC: 1.9 DEC: 5 VEP: 0 Revision: 0
[    3.928662] [drm] PSP loading VCN firmware
[    4.467037] [drm] reserve 0x900000 from 0x81fe400000 for PSP TMR
[    4.537030] amdgpu 0000:28:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    4.543105] amdgpu 0000:28:00.0: amdgpu: use vbios provided pptable
[    4.543107] amdgpu 0000:28:00.0: amdgpu: smc_dpm_info table revision(format.content): 4.5
[    4.587821] amdgpu 0000:28:00.0: amdgpu: SMU is initialized successfully!
[    4.588023] [drm] Display Core initialized with v3.2.95!
[    4.629416] scsi 9:0:0:0: Direct-Access     Generic- SD/MMC           1.00 PQ: 0 ANSI: 0
[    4.629813] scsi 9:0:0:1: Direct-Access     Generic- Compact Flash    1.01 PQ: 0 ANSI: 0
[    4.630161] scsi 9:0:0:2: Direct-Access     Generic- SM/xD-Picture    1.02 PQ: 0 ANSI: 0
[    4.630586] scsi 9:0:0:3: Direct-Access     Generic- MS/MS-Pro        1.03 PQ: 0 ANSI: 0 CCS
[    4.630715] sd 9:0:0:0: Attached scsi generic sg1 type 0
[    4.630784] sd 9:0:0:1: Attached scsi generic sg2 type 0
[    4.630843] sd 9:0:0:2: Attached scsi generic sg3 type 0
[    4.630906] sd 9:0:0:3: Attached scsi generic sg4 type 0
[    4.692619] [drm] kiq ring mec 2 pipe 1 q 0
[    4.697026] [drm] VCN decode and encode initialized successfully(under DPG Mode).
[    4.697405] [drm] JPEG decode initialized successfully.
[    4.698059] kfd kfd: Allocated 3969056 bytes on gart
[    4.698428] Virtual CRAT table created for GPU
[    4.698504] amdgpu: Topology: Add dGPU node [0x731f:0x1002]
[    4.698505] kfd kfd: added device 1002:731f
[    4.698507] amdgpu 0000:28:00.0: amdgpu: SE 2, SH per SE 2, CU per SH 10, active_cu_number 40
[    4.699753] [drm] fb mappable at 0xE04CA000
[    4.699754] [drm] vram apper at 0xE0000000
[    4.699754] [drm] size 8294400
[    4.699754] [drm] fb depth is 24
[    4.699755] [drm]    pitch is 7680
[    4.699786] fbcon: amdgpudrmfb (fb0) is primary device
[    4.699787] fbcon: Deferring console take-over
[    4.699788] amdgpu 0000:28:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    4.719070] amdgpu 0000:28:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[    4.719072] amdgpu 0000:28:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[    4.719073] amdgpu 0000:28:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[    4.719073] amdgpu 0000:28:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[    4.719074] amdgpu 0000:28:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[    4.719075] amdgpu 0000:28:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[    4.719076] amdgpu 0000:28:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[    4.719076] amdgpu 0000:28:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[    4.719077] amdgpu 0000:28:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
[    4.719077] amdgpu 0000:28:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng 11 on hub 0
[    4.719078] amdgpu 0000:28:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[    4.719079] amdgpu 0000:28:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on hub 0
[    4.719080] amdgpu 0000:28:00.0: amdgpu: ring vcn_dec uses VM inv eng 0 on hub 1
[    4.719080] amdgpu 0000:28:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 1 on hub 1
[    4.719081] amdgpu 0000:28:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 4 on hub 1
[    4.719082] amdgpu 0000:28:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5 on hub 1
[    4.719621] [drm] Initialized amdgpu 3.39.0 20150101 for 0000:28:00.0 on minor 0
[    5.310188] sd 9:0:0:0: [sdb] 7744512 512-byte logical blocks: (3.97 GB/3.69 GiB)
[    5.313164] sd 9:0:0:0: [sdb] Write Protect is off
[    5.313165] sd 9:0:0:0: [sdb] Mode Sense: 03 00 00 00
[    5.315163] sd 9:0:0:0: [sdb] No Caching mode page found
[    5.315164] sd 9:0:0:0: [sdb] Assuming drive cache: write through
[    5.321463] sd 9:0:0:1: [sdc] Attached SCSI removable disk
[    5.322347] sd 9:0:0:3: [sde] Attached SCSI removable disk
[    5.324122] sd 9:0:0:2: [sdd] Attached SCSI removable disk
[    5.332832]  sdb: sdb1
[    5.338163] sd 9:0:0:0: [sdb] Attached SCSI removable disk
[    6.611028] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command
[   12.243386] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command
[   12.451030] usb 4-3: device not accepting address 3, error -62
[   12.527678] usb 4-1.1: new SuperSpeed Gen 1 USB device number 4 using xhci_hcd
[   12.553118] usb 4-1.1: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.17
[   12.553119] usb 4-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   12.553120] usb 4-1.1: Product: 4-Port USB 3.0 Hub
[   12.553121] usb 4-1.1: Manufacturer: Generic
[   12.580304] hub 4-1.1:1.0: USB hub found
[   12.581503] hub 4-1.1:1.0: 4 ports detected
[   12.660019] usb 3-2: new full-speed USB device number 3 using xhci_hcd
[   12.836739] usb 3-2: New USB device found, idVendor=03f0, idProduct=7d04, bcdDevice= 1.00
[   12.836741] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   12.836742] usb 3-2: Product: Deskjet F2100 series
[   12.836743] usb 3-2: Manufacturer: HP
[   12.836743] usb 3-2: SerialNumber: CN7B84P67T0505
[   12.867023] usb 3-1.1: new high-speed USB device number 4 using xhci_hcd
[   12.971781] usb 3-1.1: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.17
[   12.971783] usb 3-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   12.971784] usb 3-1.1: Product: 4-Port USB 2.0 Hub
[   12.971784] usb 3-1.1: Manufacturer: Generic
[   13.008595] hub 3-1.1:1.0: USB hub found
[   13.009554] hub 3-1.1:1.0: 4 ports detected
[   18.387007] xhci_hcd 0000:29:00.3: xHCI host not responding to stop endpoint command.
[   18.387009] xhci_hcd 0000:29:00.3: USBSTS:
[   18.403013] xhci_hcd 0000:29:00.3: Host halt failed, -110
[   18.403013] xhci_hcd 0000:29:00.3: xHCI host controller not responding, assume dead
[   18.403017] xhci_hcd 0000:29:00.3: HC died; cleaning up
[   18.403035] xhci_hcd 0000:29:00.3: Timeout while waiting for setup device command
[   18.819014] usb 4-3: device not accepting address 5, error -108
[   18.819034] usb usb4-port3: attempt power cycle
[   18.819051] usb usb3-port3: couldn't allocate usb_device
[   18.819058] usb 3-1: USB disconnect, device number 2
[   18.819080] usb 3-1-port2: couldn't allocate usb_device
[   18.819086] usb 3-1.1: USB disconnect, device number 4
[   18.819542] usb 3-2: USB disconnect, device number 3
[   19.131014] usb usb4-port3: couldn't allocate usb_device
[   19.131020] usb 4-1: USB disconnect, device number 2
[   19.131022] usb 4-1.1: USB disconnect, device number 4
[   19.137333] kauditd_printk_skb: 5 callbacks suppressed
[   19.137334] audit: type=1130 audit(1602822745.916:16): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=dracut-initqueue comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.152888] audit: type=1130 audit(1602822745.931:17): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel msg='unit=systemd-fsck-root comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[   19.159438] BTRFS info (device nvme0n1p3): disk space caching is enabled
[   19.159439] BTRFS info (device nvme0n1p3): has skinny extents
[   19.163069] BTRFS info (device nvme0n1p3): enabling ssd optimizations
[   19.176365] audit: type=1334 audit(1602822745.955:18): prog-id=8 op=UNLOAD
[   19.176369] audit: type=1334 audit(1602822745.955:19): prog-id=7 op=UNLOAD
[   19.176375] audit: type=1334 audit(1602822745.955:20): prog-id=6 op=UNLOAD
[   19.176426] audit: type=1334 audit(1602822745.955:21): prog-id=5 op=UNLOAD
[   19.176432] audit: type=1334 audit(1602822745.955:22): prog-id=4 op=UNLOAD
[   19.176562] audit: type=1334 audit(1602822745.955:23): prog-id=3 op=UNLOAD
[   19.261049] audit: type=1334 audit(1602822746.040:24): prog-id=9 op=LOAD
[   19.261359] audit: type=1334 audit(1602822746.040:25): prog-id=10 op=LOAD
[   19.506325] SELinux:  Permission watch in class filesystem not defined in policy.
[   19.506327] SELinux:  Permission watch in class file not defined in policy.
[   19.506328] SELinux:  Permission watch_mount in class file not defined in policy.
[   19.506328] SELinux:  Permission watch_sb in class file not defined in policy.
[   19.506328] SELinux:  Permission watch_with_perm in class file not defined in policy.
[   19.506329] SELinux:  Permission watch_reads in class file not defined in policy.
[   19.506330] SELinux:  Permission watch in class dir not defined in policy.
[   19.506330] SELinux:  Permission watch_mount in class dir not defined in policy.
[   19.506331] SELinux:  Permission watch_sb in class dir not defined in policy.
[   19.506331] SELinux:  Permission watch_with_perm in class dir not defined in policy.
[   19.506331] SELinux:  Permission watch_reads in class dir not defined in policy.
[   19.506333] SELinux:  Permission watch in class lnk_file not defined in policy.
[   19.506334] SELinux:  Permission watch_mount in class lnk_file not defined in policy.
[   19.506334] SELinux:  Permission watch_sb in class lnk_file not defined in policy.
[   19.506334] SELinux:  Permission watch_with_perm in class lnk_file not defined in policy.
[   19.506335] SELinux:  Permission watch_reads in class lnk_file not defined in policy.
[   19.506336] SELinux:  Permission watch in class chr_file not defined in policy.
[   19.506336] SELinux:  Permission watch_mount in class chr_file not defined in policy.
[   19.506336] SELinux:  Permission watch_sb in class chr_file not defined in policy.
[   19.506337] SELinux:  Permission watch_with_perm in class chr_file not defined in policy.
[   19.506337] SELinux:  Permission watch_reads in class chr_file not defined in policy.
[   19.506338] SELinux:  Permission watch in class blk_file not defined in policy.
[   19.506338] SELinux:  Permission watch_mount in class blk_file not defined in policy.
[   19.506338] SELinux:  Permission watch_sb in class blk_file not defined in policy.
[   19.506339] SELinux:  Permission watch_with_perm in class blk_file not defined in policy.
[   19.506339] SELinux:  Permission watch_reads in class blk_file not defined in policy.
[   19.506340] SELinux:  Permission watch in class sock_file not defined in policy.
[   19.506340] SELinux:  Permission watch_mount in class sock_file not defined in policy.
[   19.506340] SELinux:  Permission watch_sb in class sock_file not defined in policy.
[   19.506341] SELinux:  Permission watch_with_perm in class sock_file not defined in policy.
[   19.506341] SELinux:  Permission watch_reads in class sock_file not defined in policy.
[   19.506342] SELinux:  Permission watch in class fifo_file not defined in policy.
[   19.506342] SELinux:  Permission watch_mount in class fifo_file not defined in policy.
[   19.506342] SELinux:  Permission watch_sb in class fifo_file not defined in policy.
[   19.506343] SELinux:  Permission watch_with_perm in class fifo_file not defined in policy.
[   19.506343] SELinux:  Permission watch_reads in class fifo_file not defined in policy.
[   19.506369] SELinux:  Permission perfmon in class capability2 not defined in policy.
[   19.506369] SELinux:  Permission bpf in class capability2 not defined in policy.
[   19.506370] SELinux:  Permission checkpoint_restore in class capability2 not defined in policy.
[   19.506373] SELinux:  Permission perfmon in class cap2_userns not defined in policy.
[   19.506374] SELinux:  Permission bpf in class cap2_userns not defined in policy.
[   19.506374] SELinux:  Permission checkpoint_restore in class cap2_userns not defined in policy.
[   19.506391] SELinux:  Class perf_event not defined in policy.
[   19.506392] SELinux:  Class lockdown not defined in policy.
[   19.506392] SELinux: the above unknown classes and permissions will be allowed
[   19.506395] SELinux:  policy capability network_peer_controls=1
[   19.506395] SELinux:  policy capability open_perms=1
[   19.506396] SELinux:  policy capability extended_socket_class=1
[   19.506396] SELinux:  policy capability always_check_network=0
[   19.506396] SELinux:  policy capability cgroup_seclabel=1
[   19.506397] SELinux:  policy capability nnp_nosuid_transition=1
[   19.506397] SELinux:  policy capability genfs_seclabel_symlinks=0
[   19.522542] systemd[1]: Successfully loaded SELinux policy in 82.499ms.
[   19.526119] systemd[1]: RTC configured in localtime, applying delta of 660 minutes to system time.
[   19.560716] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup in 23.595ms.
[   19.562591] systemd[1]: systemd v246.6-3.fc33 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +ZSTD +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=unified)
[   19.574037] systemd[1]: Detected architecture x86-64.
[   19.574321] systemd[1]: Set hostname to <wopr>.
[   19.595542] zram_generator::generator[635]: Creating dev-zram0.swap for /dev/zram0 (4096MB)
[   19.605882] zram: Added device: zram0
[   19.634677] systemd[1]: /usr/lib/systemd/system/plymouth-start.service:15: Unit configured to use KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update your service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.
[   19.650643] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-udev.service:27: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.650647] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-udev.service:28: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.650833] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-trigger.service:23: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.650837] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-trigger.service:24: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.651259] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-pivot.service:30: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.651262] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-pivot.service:31: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.651442] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-mount.service:22: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.651445] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-pre-mount.service:23: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.651671] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-mount.service:22: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.651675] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-mount.service:23: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.651812] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-initqueue.service:24: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.651816] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-initqueue.service:25: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.651955] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-cmdline.service:26: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.651958] systemd[1]: /usr/lib/dracut/modules.d/98dracut-systemd/dracut-cmdline.service:27: Standard output type syslog+console is obsolete, automatically updating to journal+console. Please update your unit file, and consider removing the setting altogether.
[   19.653736] systemd[1]: /usr/lib/systemd/system/alsa-restore.service:15: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.660236] systemd[1]: /usr/lib/systemd/system/mcelog.service:8: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
[   19.720244] systemd[1]: initrd-switch-root.service: Succeeded.
[   19.720366] systemd[1]: Stopped Switch Root.
[   19.720704] systemd[1]: systemd-journald.service: Scheduled restart job, restart counter is at 1.
[   19.720872] systemd[1]: Created slice system-getty.slice.
[   19.721018] systemd[1]: Created slice system-modprobe.slice.
[   19.721194] systemd[1]: Created slice system-swap\x2dcreate.slice.
[   19.721329] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[   19.721496] systemd[1]: Created slice User and Session Slice.
[   19.721517] systemd[1]: Condition check resulted in Dispatch Password Requests to Console Directory Watch being skipped.
[   19.721583] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[   19.721851] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   19.721879] systemd[1]: Reached target Local Encrypted Volumes.
[   19.721895] systemd[1]: Reached target Login Prompts.
[   19.721913] systemd[1]: Stopped target Switch Root.
[   19.721927] systemd[1]: Stopped target Initrd File Systems.
[   19.721938] systemd[1]: Stopped target Initrd Root File System.
[   19.721976] systemd[1]: Reached target Slices.
[   19.722292] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[   19.722854] systemd[1]: Listening on LVM2 poll daemon socket.
[   19.723714] systemd[1]: Listening on Process Core Dump Socket.
[   19.723789] systemd[1]: Listening on initctl Compatibility Named Pipe.
[   19.724109] systemd[1]: Listening on udev Control Socket.
[   19.724290] systemd[1]: Listening on udev Kernel Socket.
[   19.724775] systemd[1]: Listening on User Database Manager Socket.
[   19.725551] systemd[1]: Mounting Huge Pages File System...
[   19.726221] systemd[1]: Mounting POSIX Message Queue File System...
[   19.726746] systemd[1]: Mounting Kernel Debug File System...
[   19.726819] systemd[1]: Condition check resulted in Kernel Module supporting RPCSEC_GSS being skipped.
[   19.727341] systemd[1]: Starting Create list of static device nodes for the current kernel...
[   19.727823] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
[   19.727875] systemd[1]: Condition check resulted in Load Kernel Module drm being skipped.
[   19.728334] systemd[1]: Starting Preprocess NFS configuration convertion...
[   19.728457] systemd[1]: plymouth-switch-root.service: Succeeded.
[   19.728568] systemd[1]: Stopped Plymouth switch root service.
[   19.728698] systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
[   19.728786] systemd[1]: systemd-fsck-root.service: Succeeded.
[   19.728896] systemd[1]: Stopped File System Check on Root Device.
[   19.728955] systemd[1]: Stopped Journal Service.
[   19.729957] systemd[1]: Starting Journal Service...
[   19.730560] systemd[1]: Starting Load Kernel Modules...
[   19.731070] systemd[1]: Starting Remount Root and Kernel File Systems...
[   19.731120] systemd[1]: Condition check resulted in Repartition Root Disk being skipped.
[   19.731637] systemd[1]: Starting Coldplug All udev Devices...
[   19.732239] systemd[1]: sysroot.mount: Succeeded.
[   19.732711] systemd[1]: Mounted Huge Pages File System.
[   19.732816] systemd[1]: Mounted POSIX Message Queue File System.
[   19.732908] systemd[1]: Mounted Kernel Debug File System.
[   19.733166] systemd[1]: Finished Create list of static device nodes for the current kernel.
[   19.733401] systemd[1]: nfs-convert.service: Succeeded.
[   19.733509] systemd[1]: Finished Preprocess NFS configuration convertion.
[   19.736515] BTRFS info (device nvme0n1p3): disk space caching is enabled
[   19.737238] systemd[1]: Finished Load Kernel Modules.
[   19.737475] systemd[1]: Finished Remount Root and Kernel File Systems.
[   19.738184] systemd[1]: Mounting FUSE Control File System...
[   19.738240] systemd[1]: Condition check resulted in OSTree Remount OS/ Bind Mounts being skipped.
[   19.738273] systemd[1]: Condition check resulted in First Boot Wizard being skipped.
[   19.738786] systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
[   19.739277] systemd[1]: Starting Load/Save Random Seed...
[   19.739757] systemd[1]: Starting Apply Kernel Variables...
[   19.739807] systemd[1]: Condition check resulted in Create System Users being skipped.
[   19.740257] systemd[1]: Starting Create Static Device Nodes in /dev...
[   19.740815] systemd[1]: Mounted FUSE Control File System.
[   19.747103] systemd[1]: Finished Apply Kernel Variables.
[   19.755400] systemd[1]: Started Journal Service.
[   19.869815] acpi_cpufreq: overriding BIOS provided _PSD data
[   19.975352] input: PC Speaker as /devices/platform/pcspkr/input/input9
[   19.975501] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[   19.975503] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[   19.975562] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[   19.987607] RAPL PMU: API unit is 2^-32 Joules, 1 fixed counters, 163840 ms ovfl timer
[   19.987608] RAPL PMU: hw unit of domain package 2^-16 Joules
[   19.990391] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[   19.990454] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
[   19.990463] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[   20.044540] zram0: detected capacity change from 0 to 4294967296
[   20.072079] Adding 4194300k swap on /dev/zram0.  Priority:100 extents:1 across:4194300k SSFS
[   20.085620] kvm: Nested Virtualization enabled
[   20.085628] SVM: kvm: Nested Paging enabled
[   20.085629] SVM: Virtual VMLOAD VMSAVE supported
[   20.085629] SVM: Virtual GIF supported
[   20.089253] MCE: In-kernel MCE decoding enabled.
[   20.121259] EDAC amd64: F17h detected (node 0).
[   20.121340] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.129530] snd_hda_intel 0000:28:00.1: Force to non-snoop mode
[   20.129911] snd_hda_intel 0000:2a:00.3: enabling device (0000 -> 0002)
[   20.175664] EDAC amd64: F17h detected (node 0).
[   20.175710] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.178027] snd_hda_intel 0000:28:00.1: bound 0000:28:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   20.179361] input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input10
[   20.179403] input: HDA ATI HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input11
[   20.179451] input: HDA ATI HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input12
[   20.179485] input: HDA ATI HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input13
[   20.179521] input: HDA ATI HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input14
[   20.179552] input: HDA ATI HDMI HDMI/DP,pcm=11 as /devices/pci0000:00/0000:00:03.1/0000:26:00.0/0000:27:00.0/0000:28:00.1/sound/card0/input15
[   20.188169] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
[   20.188171] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   20.188172] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
[   20.188173] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[   20.188174] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
[   20.188175] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   20.188176] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
[   20.188177] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
[   20.188178] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
[   20.202760] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input16
[   20.202829] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input17
[   20.202893] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input18
[   20.202955] input: HD-Audio Generic Line Out Front as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input19
[   20.203019] input: HD-Audio Generic Line Out Surround as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input20
[   20.203069] input: HD-Audio Generic Line Out CLFE as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input21
[   20.203115] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:2a:00.3/sound/card1/input22
[   20.229691] EDAC amd64: F17h detected (node 0).
[   20.229731] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.282798] EDAC amd64: F17h detected (node 0).
[   20.282844] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.332965] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Opts: (null)
[   20.333832] EDAC amd64: F17h detected (node 0).
[   20.333874] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.374556] EDAC amd64: F17h detected (node 0).
[   20.374602] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.432895] EDAC amd64: F17h detected (node 0).
[   20.432936] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.493730] EDAC amd64: F17h detected (node 0).
[   20.493774] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.505013] RPC: Registered named UNIX socket transport module.
[   20.505014] RPC: Registered udp transport module.
[   20.505014] RPC: Registered tcp transport module.
[   20.505014] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   20.540333] EDAC amd64: F17h detected (node 0).
[   20.540368] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.582577] EDAC amd64: F17h detected (node 0).
[   20.582616] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.619487] EDAC amd64: F17h detected (node 0).
[   20.619522] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.658346] EDAC amd64: F17h detected (node 0).
[   20.658382] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.694232] EDAC amd64: F17h detected (node 0).
[   20.694273] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.733591] EDAC amd64: F17h detected (node 0).
[   20.733634] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.765687] EDAC amd64: F17h detected (node 0).
[   20.765729] EDAC amd64: Node 0: DRAM ECC disabled.
[   20.799418] EDAC amd64: F17h detected (node 0).
[   20.799453] EDAC amd64: Node 0: DRAM ECC disabled.
[   23.848537] rfkill: input handler disabled
[   24.002558] igb 0000:22:00.0 enp34s0: igb: enp34s0 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: RX/TX
[   24.109266] IPv6: ADDRCONF(NETDEV_CHANGE): enp34s0: link becomes ready
[   25.968401] input: Yubico YubiKey OTP+FIDO+CCID as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-13/1-13:1.0/0003:1050:0407.0008/input/input23
[   26.020482] hid-generic 0003:1050:0407.0008: input,hidraw5: USB HID v1.10 Keyboard [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:03:00.0-13/input0
[   27.991636] input: Yubico YubiKey OTP+FIDO+CCID as /devices/pci0000:00/0000:00:01.3/0000:03:00.0/usb1/1-13/1-13:1.0/0003:1050:0407.0009/input/input24
[   28.043470] hid-generic 0003:1050:0407.0009: input,hidraw5: USB HID v1.10 Keyboard [Yubico YubiKey OTP+FIDO+CCID] on usb-0000:03:00.0-13/input0

--=-XKtYROG54HtIajaGSmXz--


