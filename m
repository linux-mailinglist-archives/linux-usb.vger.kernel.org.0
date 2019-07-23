Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F2B71ABB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 16:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732700AbfGWOsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 10:48:07 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:40907 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732571AbfGWOsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 10:48:06 -0400
Received: by mail-io1-f70.google.com with SMTP id v11so47435681iop.7
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 07:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=KJuDD1pYeLyTEIdlDB5Ulq2vfShQZKEuG0FhGDuKNWU=;
        b=Zmw3QT6RJsCQh5cfUdU7EMwO+T9UioqBanB4PcjXerTRKnndG/mYsEQnKvBE22U8SS
         /tythsSXZt+EVML3yx8VBkCjo756mHNI2k8Fp/ctHDlqbjqq8TUAorNVEUkZ0bQcZKpO
         BatZrVMrr4FjrTm2m1p9xLmHT8jCNoQRuA/rMwJVq9LWQHPy3zsl//dUpW23ke7qmCDo
         iMYDRdMxfw3EJkI3sUf2BJFnRYWUtlB0jF7i+QvwPoMegjqDS3qxCgi/kW+4JU/mOX5B
         NUrqnfbsMVtIQRlX7u4GdzMgubKCqYhjOF+NUU3ndO2rVYd/T4k8MOxqcLJybMcMqNMx
         67RQ==
X-Gm-Message-State: APjAAAX211x6EXxrRoK7rYKwtVSIEdup0LQhycUyKPKZU797sNPjmtX3
        EeNrfz8n7My7gGCt+FB+eSFGCGKWvv+43yr4847z2UhJbt7G
X-Google-Smtp-Source: APXvYqztMehPCbgahXctUk91afSxsuTCZY9NPOZdyZji9mO1RktsvFtPy75cinCvWTzOCWcHQ+CI0DwcqVxdh+i3fvDtHkQR5bIX
MIME-Version: 1.0
X-Received: by 2002:a5d:9d42:: with SMTP id k2mr22261703iok.45.1563893285759;
 Tue, 23 Jul 2019 07:48:05 -0700 (PDT)
Date:   Tue, 23 Jul 2019 07:48:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c3c7b6058e5a47af@google.com>
Subject: usb-fuzzer boot error: general protection fault in dma_direct_max_mapping_size
From:   syzbot <syzbot+4efacf59126f1ae87000@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    1154c0b0 wip
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1197774c600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b228fb19779df17d
dashboard link: https://syzkaller.appspot.com/bug?extid=4efacf59126f1ae87000
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4efacf59126f1ae87000@syzkaller.appspotmail.com

RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
pci 0000:00:00.0: Limiting direct PCI/PCI transfers
PCI: CLS 0 bytes, default 64
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
software IO TLB: mapped [mem 0xbbffd000-0xbfffd000] (64MB)
RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl  
timer
clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x212735223b2,  
max_idle_ns: 440795277976 ns
clocksource: Switched to clocksource tsc
check: Scanning for low memory corruption every 60 seconds
Initialise system trusted keyrings
workingset: timestamp_bits=40 max_order=21 bucket_order=0
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
9p: Installing v9fs 9p2000 file system support
Key type asymmetric registered
Asymmetric key parser 'x509' registered
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
io scheduler mq-deadline registered
io scheduler kyber registered
usbcore: registered new interface driver udlfb
usbcore: registered new interface driver smscufx
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
ACPI: Power Button [PWRF]
input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
ACPI: Sleep Button [SLPF]
PCI Interrupt Link [LNKC] enabled at IRQ 11
virtio-pci 0000:00:03.0: virtio_pci: leaving for legacy driver
PCI Interrupt Link [LNKD] enabled at IRQ 10
virtio-pci 0000:00:04.0: virtio_pci: leaving for legacy driver
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
00:04: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
00:05: ttyS2 at I/O 0x3e8 (irq = 6, base_baud = 115200) is a 16550A
00:06: ttyS3 at I/O 0x2e8 (irq = 7, base_baud = 115200) is a 16550A
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
usbcore: registered new interface driver udl
loop: module loaded
usbcore: registered new interface driver rtsx_usb
usbcore: registered new interface driver viperboard
usbcore: registered new interface driver dln2
usbcore: registered new interface driver pn533_usb
usbcore: registered new interface driver port100
usbcore: registered new interface driver nfcmrvl
scsi host0: Virtio SCSI HBA
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc1+ #16
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:dma_addressing_limited /./include/linux/dma-mapping.h:692 [inline]
RIP: 0010:dma_direct_max_mapping_size+0x73/0x19a /kernel/dma/direct.c:408
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 1e 01 00 00 48 8b 9d 38 03  
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <80> 3c 02 00 0f  
85 06 01 00 00 48 8d bd 48 03 00 00 48 8b 1b 48 b8
RSP: 0000:ffff8881da18f628 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff812d716c
RDX: 0000000000000000 RSI: ffffffff812d7189 RDI: ffff8881d7428378
RBP: ffff8881d7428040 R08: ffff8881da180000 R09: ffffed103ade30cb
R10: ffffed103ade30ca R11: ffff8881d6f18657 R12: ffff8881d7428040
R13: ffff8881d769e8b0 R14: 0000000000000200 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000006a21000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  dma_max_mapping_size+0xb5/0xf0 /kernel/dma/mapping.c:375
  __scsi_init_queue+0x17e/0x510 /drivers/scsi/scsi_lib.c:1787
  scsi_mq_alloc_queue+0xcb/0x170 /drivers/scsi/scsi_lib.c:1833
  scsi_alloc_sdev+0x82e/0xc50 /drivers/scsi/scsi_scan.c:269
  scsi_probe_and_add_lun+0x1ee5/0x2cd0 /drivers/scsi/scsi_scan.c:1078
  __scsi_scan_target+0x273/0xc30 /drivers/scsi/scsi_scan.c:1562
  scsi_scan_channel.part.0+0x126/0x1a0 /drivers/scsi/scsi_scan.c:1650
  scsi_scan_channel /drivers/scsi/scsi_scan.c:1677 [inline]
  scsi_scan_host_selected+0x2bb/0x3f0 /drivers/scsi/scsi_scan.c:1679
  do_scsi_scan_host /drivers/scsi/scsi_scan.c:1817 [inline]
  do_scsi_scan_host+0x1e8/0x260 /drivers/scsi/scsi_scan.c:1807
  scsi_scan_host /drivers/scsi/scsi_scan.c:1847 [inline]
  scsi_scan_host+0x37c/0x440 /drivers/scsi/scsi_scan.c:1835
  virtscsi_probe+0x9b7/0xbb5 /drivers/scsi/virtio_scsi.c:847
  virtio_dev_probe+0x463/0x710 /drivers/virtio/virtio.c:248
  really_probe+0x281/0x650 /drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 /drivers/base/dd.c:709
  device_driver_attach+0x108/0x140 /drivers/base/dd.c:983
  __driver_attach+0xda/0x240 /drivers/base/dd.c:1060
  bus_for_each_dev+0x14b/0x1d0 /drivers/base/bus.c:304
  bus_add_driver+0x44e/0x5a0 /drivers/base/bus.c:645
  driver_register+0x1c4/0x320 /drivers/base/driver.c:170
  __write_once_size /./include/linux/compiler.h:226 [inline]
  INIT_LIST_HEAD /./include/linux/list.h:28 [inline]
  init+0xa1/0x115 /drivers/char/virtio_console.c:2251
  do_one_initcall+0xf0/0x614 /init/main.c:939
  do_initcall_level /init/main.c:1007 [inline]
  do_initcalls /init/main.c:1015 [inline]
  do_basic_setup /init/main.c:1032 [inline]
  kernel_init_freeable+0x4a9/0x596 /init/main.c:1192
  kernel_init+0xd/0x1bf /init/main.c:1110
  ret_from_fork+0x24/0x30 /arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 73ab592d53bc046f ]---
RIP: 0010:dma_addressing_limited /./include/linux/dma-mapping.h:692 [inline]
RIP: 0010:dma_direct_max_mapping_size+0x73/0x19a /kernel/dma/direct.c:408
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 1e 01 00 00 48 8b 9d 38 03  
00 00 48 b8 00 00 00 00 00 fc ff df 48 89 da 48 c1 ea 03 <80> 3c 02 00 0f  
85 06 01 00 00 48 8d bd 48 03 00 00 48 8b 1b 48 b8
RSP: 0000:ffff8881da18f628 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff812d716c
RDX: 0000000000000000 RSI: ffffffff812d7189 RDI: ffff8881d7428378
RBP: ffff8881d7428040 R08: ffff8881da180000 R09: ffffed103ade30cb
R10: ffffed103ade30ca R11: ffff8881d6f18657 R12: ffff8881d7428040
R13: ffff8881d769e8b0 R14: 0000000000000200 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000006a21000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
