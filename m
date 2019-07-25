Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA5974CF0
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 13:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391810AbfGYLWU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 07:22:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42416 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389393AbfGYLWT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 07:22:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so22593338pff.9
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2019 04:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/buOXWJhuOa8MsnMfU9bqAx0bZt2rL22F4TV30F6mU=;
        b=s33wdkrXwYNXMQUepGQyABTGnWjLroX6dRT7sKiziqYJMvZkCxTV00saEFylgbpEyK
         cYtPnLFAHkYWTH9X4Cbbghs0ht4VSP90B06p/btLX/z/InT/ki9r+yGUxSxdSDM8QAMe
         cJHg4FZAX13oM7Ols2TaWk1s8giEJdu99aJM704+X7YubyMQpGIZOYhFntl9DZSOVHhJ
         kPPkGRTKzus3RAk0uPW/NpWx6ZrsFTwtSw0hhXz1yCphwLL0wm4ERjTcbOZJD15s2nvA
         FZnmHgsAloJitQ19rfKT+LcvjN8Hkex2hb5TNrCIgqTIgfKqr8P/IURFcNsrBkYw7lWI
         zP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/buOXWJhuOa8MsnMfU9bqAx0bZt2rL22F4TV30F6mU=;
        b=G6btMANIicP6MntPyqjNYo+f9s4tO/NGCLwJJVi5QGiWWzwJMqD0VUfQ/e9thjJhIv
         Ife9j8ngWgUjOZi7jLxOB5dVv4Au9BbRMs3WrmG00uXUwrfxF3S8CDPdbxFpeDRlZw7h
         WBnyrWNpuOknT0L4myGskDACCJoHiC3Z8jhspSfodjsBPHM6LTSgpcQcCh5Sv6f6LT1o
         70SaAVkLWmQNlfbLOqQ184+9EMOLR/rjOY9Mrbi+fc4kQ/m5/LmN3j4neCVkfUKRGdG0
         KA8RxRJ347TMzhVO/ZpQhmDXYWVIF5OKN1wFDxX2fskbAH+fK1E0ZwqRwByO4Ri+8eWy
         VuSg==
X-Gm-Message-State: APjAAAXx8Ozlf6Kz+XIAcvtkBHS9610mLXMSUGRgCsL6L6ENOF2gcGlq
        cXGeRi2TQQZvWkN56OPF5av/nZFCAUQlAjsRCGSreA==
X-Google-Smtp-Source: APXvYqwWnCMih02p79pONBaPOPspXR7s7Jv1J689d1O5+r5YcMrZ2ZxJxrYH4JHIow8mLsWgMlvqlKiKPyg1mjQYKZw=
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr16531019pfq.25.1564053737536;
 Thu, 25 Jul 2019 04:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <1564001709.4670.10.camel@suse.com> <000000000000ebd2de058e73d059@google.com>
In-Reply-To: <000000000000ebd2de058e73d059@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 25 Jul 2019 13:22:06 +0200
Message-ID: <CAAeHK+zkaij30c3DR-dy8tVVeDct8_rLWARUdr+ocDTLYoWx-w@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
To:     syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 11:16 PM syzbot
<syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot tried to test the proposed patch but build/boot failed:

5.3-rc1 has a boot time bug, so the usb-fuzzer branch is broken right
now. Could you try using the usb-fuzzer-usb-testing-2019.07.11 branch
instead for testing your patches?

>
>     T1] devtmpfs: initialized
> [    2.873454][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    2.873454][    T1] futex hash table entries: 512 (order: 4, 65536
> bytes, linear)
> [    2.875783][    T1] PM: RTC time: 21:05:06, date: 2019-07-24
> [    2.882105][    T1] NET: Registered protocol family 16
> [    2.886588][    T1] audit: initializing netlink subsys (disabled)
> [    2.888579][   T22] audit: type=2000 audit(1564002306.507:1):
> state=initialized audit_enabled=0 res=1
> [    2.888579][    T1] cpuidle: using governor menu
> [    2.893505][    T1] ACPI: bus type PCI registered
> [    2.894935][    T1] PCI: Using configuration type 1 for base access
> [    3.002926][    T1] HugeTLB registered 2.00 MiB page size, pre-allocated
> 0 pages
> [    3.003285][   T27] cryptomgr_test (27) used greatest stack depth: 30208
> bytes left
> [    3.003285][   T29] kworker/u4:0 (29) used greatest stack depth: 27608
> bytes left
> [    3.011409][   T43] kworker/u4:0 (43) used greatest stack depth: 27120
> bytes left
> [    3.022044][    T1] ACPI: Added _OSI(Module Device)
> [    3.022884][    T1] ACPI: Added _OSI(Processor Device)
> [    3.023651][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    3.031207][    T1] ACPI: Added _OSI(Processor Aggregator Device)
> [    3.031207][    T1] ACPI: Added _OSI(Linux-Dell-Video)
> [    3.031249][    T1] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> [    3.032156][    T1] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
> [    3.082907][    T1] ACPI: 2 ACPI AML tables successfully acquired and
> loaded
> [    3.097843][    T1] ACPI: Interpreter enabled
> [    3.098853][    T1] ACPI: (supports S0 S3 S4 S5)
> [    3.099590][    T1] ACPI: Using IOAPIC for interrupt routing
> [    3.100591][    T1] PCI: Using host bridge windows from ACPI; if
> necessary, use "pci=nocrs" and report a bug
> [    3.104257][    T1] ACPI: Enabled 16 GPEs in block 00 to 0F
> [    3.182493][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus
> 00-ff])
> [    3.183851][    T1] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM
> Segments MSI HPX-Type3]
> [    3.185519][    T1] acpi PNP0A03:00: fail to add MMCONFIG information,
> can't access extended PCI configuration space under this bridge.
> [    3.192575][    T1] PCI host bridge to bus 0000:00
> [    3.193286][    T1] pci_bus 0000:00: root bus resource [io
> 0x0000-0x0cf7 window]
> [    3.194360][    T1] pci_bus 0000:00: root bus resource [io
> 0x0d00-0xffff window]
> [    3.195393][    T1] pci_bus 0000:00: root bus resource [mem
> 0x000a0000-0x000bffff window]
> [    3.196522][    T1] pci_bus 0000:00: root bus resource [mem
> 0xc0000000-0xfebfffff window]
> [    3.197715][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    3.198886][    T1] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    3.204649][    T1] pci 0000:00:01.0: [8086:7110] type 00 class 0x060100
> [    3.222865][    T1] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    3.241306][    T1] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed
> by PIIX4 ACPI
> [    3.245348][    T1] pci 0000:00:03.0: [1af4:1004] type 00 class 0x000000
> [    3.251166][    T1] pci 0000:00:03.0: reg 0x10: [io  0xc000-0xc03f]
> [    3.255600][    T1] pci 0000:00:03.0: reg 0x14: [mem
> 0xfebfe000-0xfebfe07f]
> [    3.271694][    T1] pci 0000:00:04.0: [1af4:1000] type 00 class 0x020000
> [    3.277964][    T1] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    3.283798][    T1] pci 0000:00:04.0: reg 0x14: [mem
> 0xfebff000-0xfebff07f]
> [    3.310020][    T1] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> [    3.314509][    T1] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> [    3.318340][    T1] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> [    3.322364][    T1] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> [    3.324796][    T1] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> [    3.332253][    T1] vgaarb: loaded
> [    3.333359][    T1] SCSI subsystem initialized
> [    3.334153][    T1] ACPI: bus type USB registered
> [    3.334153][    T1] usbcore: registered new interface driver usbfs
> [    3.334153][    T1] usbcore: registered new interface driver hub
> [    3.341195][    T1] usbcore: registered new device driver usb
> [    3.341471][    T1] mc: Linux media interface: v0.10
> [    3.342295][    T1] videodev: Linux video capture interface: v2.00
> [    3.343599][    T1] pps_core: LinuxPPS API ver. 1 registered
> [    3.344464][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
> Rodolfo Giometti <giometti@linux.it>
> [    3.345876][    T1] PTP clock support registered
> [    3.346781][    T1] EDAC MC: Ver: 3.0.0
> [    3.346781][    T1] Advanced Linux Sound Architecture Driver Initialized.
> [    3.346781][    T1] PCI: Using ACPI for IRQ routing
> [    3.353286][    T1] Bluetooth: Core ver 2.22
> [    3.354202][    T1] NET: Registered protocol family 31
> [    3.354955][    T1] Bluetooth: HCI device and connection manager
> initialized
> [    3.355989][    T1] Bluetooth: HCI socket layer initialized
> [    3.356767][    T1] Bluetooth: L2CAP socket layer initialized
> [    3.357644][    T1] Bluetooth: SCO socket layer initialized
> [    3.358472][    T1] NET: Registered protocol family 8
> [    3.359220][    T1] NET: Registered protocol family 20
> [    3.360093][    T1] NetLabel: Initializing
> [    3.360715][    T1] NetLabel:  domain hash size = 128
> [    3.361148][    T1] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [    3.362492][    T1] NetLabel:  unlabeled traffic allowed by default
> [    3.363724][    T1] nfc: nfc_init: NFC Core ver 0.1
> [    3.363724][    T1] NET: Registered protocol family 39
> [    3.365420][    T1] clocksource: Switched to clocksource kvm-clock
> [    4.371843][    T1] VFS: Disk quotas dquot_6.6.0
> [    4.372992][    T1] VFS: Dquot-cache hash table entries: 512 (order 0,
> 4096 bytes)
> [    4.374598][    T1] *** VALIDATE hugetlbfs ***
> [    4.376107][    T1] pnp: PnP ACPI init
> [    4.387313][    T1] pnp: PnP ACPI: found 7 devices
> [    4.413711][    T1] thermal_sys: Registered thermal governor 'step_wise'
> [    4.413717][    T1] thermal_sys: Registered thermal governor 'user_space'
> [    4.419892][    T1] clocksource: acpi_pm: mask: 0xffffff max_cycles:
> 0xffffff, max_idle_ns: 2085701024 ns
> [    4.422972][    T1] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7
> window]
> [    4.424189][    T1] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff
> window]
> [    4.425394][    T1] pci_bus 0000:00: resource 6 [mem
> 0x000a0000-0x000bffff window]
> [    4.426791][    T1] pci_bus 0000:00: resource 7 [mem
> 0xc0000000-0xfebfffff window]
> [    4.428947][    T1] NET: Registered protocol family 2
> [    4.431371][    T1] tcp_listen_portaddr_hash hash table entries: 4096
> (order: 6, 294912 bytes, linear)
> [    4.433417][    T1] TCP established hash table entries: 65536 (order: 7,
> 524288 bytes, linear)
> [    4.435847][    T1] TCP bind hash table entries: 65536 (order: 10,
> 4194304 bytes, linear)
> [    4.443410][    T1] TCP: Hash tables configured (established 65536 bind
> 65536)
> [    4.445306][    T1] UDP hash table entries: 4096 (order: 7, 655360
> bytes, linear)
> [    4.447824][    T1] UDP-Lite hash table entries: 4096 (order: 7, 655360
> bytes, linear)
> [    4.450432][    T1] NET: Registered protocol family 1
> [    4.453345][    T1] RPC: Registered named UNIX socket transport module.
> [    4.454510][    T1] RPC: Registered udp transport module.
> [    4.455454][    T1] RPC: Registered tcp transport module.
> [    4.456446][    T1] RPC: Registered tcp NFSv4.1 backchannel transport
> module.
> [    4.458621][    T1] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    4.459864][    T1] PCI: CLS 0 bytes, default 64
> [    4.461378][    T1] PCI-DMA: Using software bounce buffering for IO
> (SWIOTLB)
> [    4.462761][    T1] software IO TLB: mapped [mem 0xbbffd000-0xbfffd000]
> (64MB)
> [    4.466413][    T1] RAPL PMU: API unit is 2^-32 Joules, 0 fixed
> counters, 10737418240 ms ovfl timer
> [    4.467994][    T1] clocksource: tsc: mask: 0xffffffffffffffff
> max_cycles: 0x212735223b2, max_idle_ns: 440795277976 ns
> [    4.469791][    T1] clocksource: Switched to clocksource tsc
> [    4.473423][    T1] check: Scanning for low memory corruption every 60
> seconds
> [    4.478343][    T1] Initialise system trusted keyrings
> [    4.479810][    T1] workingset: timestamp_bits=40 max_order=21
> bucket_order=0
> [    4.521420][    T1] NFS: Registering the id_resolver key type
> [    4.522729][    T1] Key type id_resolver registered
> [    4.523526][    T1] Key type id_legacy registered
> [    4.524942][    T1] 9p: Installing v9fs 9p2000 file system support
> [    4.531784][    T1] Key type asymmetric registered
> [    4.532779][    T1] Asymmetric key parser 'x509' registered
> [    4.533772][    T1] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 247)
> [    4.535226][    T1] io scheduler mq-deadline registered
> [    4.536032][    T1] io scheduler kyber registered
> [    4.539777][    T1] usbcore: registered new interface driver udlfb
> [    4.541021][    T1] usbcore: registered new interface driver smscufx
> [    4.543014][    T1] input: Power Button as
> /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> [    4.544520][    T1] ACPI: Power Button [PWRF]
> [    4.545743][    T1] input: Sleep Button as
> /devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
> [    4.547129][    T1] ACPI: Sleep Button [SLPF]
> [    4.560609][    T1] PCI Interrupt Link [LNKC] enabled at IRQ 11
> [    4.562043][    T1] virtio-pci 0000:00:03.0: virtio_pci: leaving for
> legacy driver
> [    4.575190][    T1] PCI Interrupt Link [LNKD] enabled at IRQ 10
> [    4.576547][    T1] virtio-pci 0000:00:04.0: virtio_pci: leaving for
> legacy driver
> [    4.582237][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing
> enabled
> [    4.606272][    T1] 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud =
> 115200) is a 16550A
> [    4.631884][    T1] 00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud =
> 115200) is a 16550A
> [    4.656881][    T1] 00:05: ttyS2 at I/O 0x3e8 (irq = 6, base_baud =
> 115200) is a 16550A
> [    4.682193][    T1] 00:06: ttyS3 at I/O 0x2e8 (irq = 7, base_baud =
> 115200) is a 16550A
> [    4.687302][    T1] Non-volatile memory driver v1.3
> [    4.688815][    T1] Linux agpgart interface v0.103
> [    4.695497][    T1] usbcore: registered new interface driver udl
> [    4.719445][    T1] loop: module loaded
> [    4.721039][    T1] usbcore: registered new interface driver rtsx_usb
> [    4.723136][    T1] usbcore: registered new interface driver viperboard
> [    4.725065][    T1] usbcore: registered new interface driver dln2
> [    4.726853][    T1] usbcore: registered new interface driver pn533_usb
> [    4.729089][    T1] usbcore: registered new interface driver port100
> [    4.731604][    T1] usbcore: registered new interface driver nfcmrvl
> [    4.746210][    T1] scsi host0: Virtio SCSI HBA
> [    4.792288][    T1] kasan: CONFIG_KASAN_INLINE enabled
> [    4.793729][    T1] kasan: GPF could be caused by NULL-ptr deref or user
> memory access
> [    4.795771][    T1] general protection fault: 0000 [#1] SMP KASAN
> [    4.797547][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc1+
> #1
> [    4.799786][    T1] Hardware name: Google Google Compute Engine/Google
> Compute Engine, BIOS Google 01/01/2011
> [    4.801153][    T1] RIP: 0010:dma_direct_max_mapping_size+0x73/0x19a
> [    4.801153][    T1] Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 1e
> 01 00 00 48 8b 9d 38 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1
> ea 03 <80> 3c 02 00 0f 85 06 01 00 00 48 8d bd 48 03 00 00 48 8b 1b 48 b8
> [    4.801153][    T1] RSP: 0000:ffff8881da18f628 EFLAGS: 00010246
> [    4.801153][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RCX:
> ffffffff812d716c
> [    4.801153][    T1] RDX: 0000000000000000 RSI: ffffffff812d7189 RDI:
> ffff8881d829fa78
> [    4.801153][    T1] RBP: ffff8881d829f740 R08: ffff8881da180000 R09:
> ffffed103ad210cb
> [    4.801153][    T1] R10: ffffed103ad210ca R11: ffff8881d6908657 R12:
> ffff8881d829f740
> [    4.801153][    T1] R13: ffff8881d76a57b0 R14: 0000000000000200 R15:
> 0000000000000000
> [    4.801153][    T1] FS:  0000000000000000(0000)
> GS:ffff8881db300000(0000) knlGS:0000000000000000
> [    4.801153][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.801153][    T1] CR2: 0000000000000000 CR3: 0000000006a21000 CR4:
> 00000000001406e0
> [    4.801153][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    4.801153][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    4.801153][    T1] Call Trace:
> [    4.801153][    T1]  dma_max_mapping_size+0xb5/0xf0
> [    4.801153][    T1]  __scsi_init_queue+0x17e/0x510
> [    4.801153][    T1]  scsi_mq_alloc_queue+0xcb/0x170
> [    4.801153][    T1]  scsi_alloc_sdev+0x82e/0xc50
> [    4.801153][    T1]  scsi_probe_and_add_lun+0x1ee5/0x2cd0
> [    4.801153][    T1]  ? find_held_lock+0x2d/0x110
> [    4.801153][    T1]  ? __pm_runtime_resume+0x111/0x180
> [    4.801153][    T1]  ? scsi_alloc_sdev+0xc50/0xc50
> [    4.801153][    T1]  ? mark_held_locks+0x9f/0xe0
> [    4.801153][    T1]  ? _raw_spin_unlock_irqrestore+0x3e/0x50
> [    4.801153][    T1]  ? lockdep_hardirqs_on+0x379/0x580
> [    4.801153][    T1]  __scsi_scan_target+0x273/0xc30
> [    4.801153][    T1]  ? find_held_lock+0x2d/0x110
> [    4.801153][    T1]  ? __pm_runtime_resume+0x111/0x180
> [    4.801153][    T1]  ? scsi_probe_and_add_lun+0x2cd0/0x2cd0
> [    4.801153][    T1]  ? mark_lock+0xbc/0x1130
> [    4.801153][    T1]  scsi_scan_channel.part.0+0x126/0x1a0
> [    4.801153][    T1]  scsi_scan_host_selected+0x2bb/0x3f0
> [    4.801153][    T1]  do_scsi_scan_host+0x1e8/0x260
> [    4.801153][    T1]  scsi_scan_host+0x37c/0x440
> [    4.801153][    T1]  virtscsi_probe+0x9b7/0xbb5
> [    4.801153][    T1]  ? virtscsi_restore+0x240/0x240
> [    4.801153][    T1]  virtio_dev_probe+0x463/0x710
> [    4.801153][    T1]  ? virtio_device_restore+0x1f0/0x1f0
> [    4.801153][    T1]  really_probe+0x281/0x650
> [    4.801153][    T1]  driver_probe_device+0x101/0x1b0
> [    4.801153][    T1]  device_driver_attach+0x108/0x140
> [    4.801153][    T1]  __driver_attach+0xda/0x240
> [    4.801153][    T1]  ? device_driver_attach+0x140/0x140
> [    4.801153][    T1]  bus_for_each_dev+0x14b/0x1d0
> [    4.801153][    T1]  ? subsys_dev_iter_exit+0x20/0x20
> [    4.801153][    T1]  bus_add_driver+0x44e/0x5a0
> [    4.801153][    T1]  driver_register+0x1c4/0x320
> [    4.801153][    T1]  ? spi_transport_init+0x132/0x132
> [    4.801153][    T1]  init+0xa1/0x115
> [    4.801153][    T1]  do_one_initcall+0xf0/0x614
> [    4.801153][    T1]  ? perf_trace_initcall_level+0x3e0/0x3e0
> [    4.801153][    T1]  ? parameq+0x110/0x160
> [    4.801153][    T1]  kernel_init_freeable+0x4a9/0x596
> [    4.801153][    T1]  ? rest_init+0x371/0x371
> [    4.801153][    T1]  kernel_init+0xd/0x1bf
> [    4.801153][    T1]  ret_from_fork+0x24/0x30
> [    4.801153][    T1] Modules linked in:
> [    4.899360][    T1] ---[ end trace 6822302347232fe4 ]---
> [    4.900898][    T1] RIP: 0010:dma_direct_max_mapping_size+0x73/0x19a
> [    4.902841][    T1] Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 1e
> 01 00 00 48 8b 9d 38 03 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1
> ea 03 <80> 3c 02 00 0f 85 06 01 00 00 48 8d bd 48 03 00 00 48 8b 1b 48 b8
> [    4.908805][    T1] RSP: 0000:ffff8881da18f628 EFLAGS: 00010246
> [    4.910502][    T1] RAX: dffffc0000000000 RBX: 0000000000000000 RCX:
> ffffffff812d716c
> [    4.913042][    T1] RDX: 0000000000000000 RSI: ffffffff812d7189 RDI:
> ffff8881d829fa78
> [    4.915172][    T1] RBP: ffff8881d829f740 R08: ffff8881da180000 R09:
> ffffed103ad210cb
> [    4.917564][    T1] R10: ffffed103ad210ca R11: ffff8881d6908657 R12:
> ffff8881d829f740
> [    4.919814][    T1] R13: ffff8881d76a57b0 R14: 0000000000000200 R15:
> 0000000000000000
> [    4.922373][    T1] FS:  0000000000000000(0000)
> GS:ffff8881db300000(0000) knlGS:0000000000000000
> [    4.925294][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.927267][    T1] CR2: 0000000000000000 CR3: 0000000006a21000 CR4:
> 00000000001406e0
> [    4.929685][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> [    4.931826][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> 0000000000000400
> [    4.934300][    T1] Kernel panic - not syncing: Fatal exception
> [    4.936582][    T1] Kernel Offset: disabled
> [    4.937961][    T1] Rebooting in 86400 seconds..
>
>
> Error text is too large and was truncated, full error text is at:
> https://syzkaller.appspot.com/x/error.txt?x=138cfa5c600000
>
>
> Tested on:
>
> commit:         1154c0b0 wip
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b228fb19779df17d
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=17678cc8600000
>
