Return-Path: <linux-usb+bounces-8358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2788BC36
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 09:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27DD31F38DFE
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 08:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C184133998;
	Tue, 26 Mar 2024 08:25:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61374132C04
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711441543; cv=none; b=oqaHsx8i7mrTG+7hXgAZCLp1kt5Cvc6JBJCX1FuS/9aO81XAre0jHGMNsePnZ9InkZ3ZayhuA3INQEKbC5GINXXUmQHE0+CEK0G1VQCjygPi/VuSnsUoz0Q6QhPbyEfmrjYGGN+o2BUnwh7r3k3o2USHxrlL4+mhUNsK16+1GvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711441543; c=relaxed/simple;
	bh=IYIJ0ZZtXKZGdV+GfwViVmMENyUaM9HipDtmquOJobQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iCtTwRK+EVpIF1TSz5+XAHq40GT8nveo07CybEhU4IXEL/4Z8ioQ5voFpOEnDhbnZDb9yxV2u0vvW9qyeZNOeSSgGyvQXUwXC5Qy0biVIjHC0TqM5KhjZizV4o/7T5uDru3QvcCcnbuI/we31Zu8N5br8300yEez2t2QkWxMfsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-368a3864192so2621965ab.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 01:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711441540; x=1712046340;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPZTu9sK/SSsF9HtLu81SIhEg9tKCo25fg56Y25baOg=;
        b=oIQrJhkJ+s+eDq9g58tQO+faNGVcmFvMPTXqAOkKw0xlRF12wYBMeMDwxmLRK9h9tq
         6PWNX9YYh/2j+NTxiOTgRAH0YKQ/kjoxdCnKiPZXJIeiugTlof03RJvPNj2YSlzJwa6w
         rwlLmkB7MiNQ70C+P+OwLaZ7bunDv7VJRZX/xNwZlPrI/NX/OwxO4Ulh63DURP8tUXi3
         ji9yYYeg2JLhDr8vKuSeDKpCtrLU7yZQCKAFBnYXak0YyIJYxgmUO4kuBfSaMLZlAHrl
         3AovloLYNe7R6jNnVKDfhvB4JSLJ12jfgohQn4Jbiww8UiwXCGC8ePqrF3GoMMS5x9Ch
         GxZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhGFiUmXpCXoOeabAGfIGzDyumP1bBC7hO2me7Ei2YfIOt6xazsWi+an3hzZWyg1T7ITmQsFJF6YrFXe1jJEYGcVoFvE/wTW3L
X-Gm-Message-State: AOJu0YwSDdnVZ2lrlSMS6TxxNg7S+y/dFNnYexPBEQ9xUUJynQcZ08Xq
	dwio84A8wiKV1/T6H9/KN4Zn/R7jKJ8Bx+H/vEPnXopz8TQxh8WJJd+QGSvz3peotB0zAM8qXsX
	T6Lv4c5OiYsFzlKsf1gHCCARDgE+9DxJ33VNGPYLRSlsm7A+ZJ92s0eE=
X-Google-Smtp-Source: AGHT+IFbpzQZ21Inxmsbcny1JXDa7DgvvhXkXH42YTCiZYr1kavzxLnjCrdWORIrUkOCfFQwK+aiIBtfFckkKGIWACh1C0Q5DTjp
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20ce:b0:368:8cf9:9ab5 with SMTP id
 14-20020a056e0220ce00b003688cf99ab5mr159226ilq.2.1711441540614; Tue, 26 Mar
 2024 01:25:40 -0700 (PDT)
Date: Tue, 26 Mar 2024 01:25:40 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000151f4a06148c0966@google.com>
Subject: [syzbot] [mm?] usb-testing boot error: WARNING: refcount bug in __reset_page_owner
From: syzbot <syzbot+73c1dfb19c10b7e49777@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4cece7649650 Linux 6.9-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12eea546180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a2bfc1e92b3816d2
dashboard link: https://syzkaller.appspot.com/bug?extid=73c1dfb19c10b7e49777
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7f5e2f772df3/disk-4cece764.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bf6c631b116f/vmlinux-4cece764.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bd864ac23a04/bzImage-4cece764.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+73c1dfb19c10b7e49777@syzkaller.appspotmail.com

ACPI: PCI: Interrupt link LNKB configured for IRQ 10
ACPI: PCI: Interrupt link LNKC configured for IRQ 11
ACPI: PCI: Interrupt link LNKD configured for IRQ 11
ACPI: PCI: Interrupt link LNKS configured for IRQ 9
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: lazy mode
SCSI subsystem initialized
ACPI: bus type USB registered
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
mc: Linux media interface: v0.10
videodev: Linux video capture interface: v2.00
pps_core: LinuxPPS API ver. 1 registered
pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
PTP clock support registered
EDAC MC: Ver: 3.0.0
Advanced Linux Sound Architecture Driver Initialized.
Bluetooth: Core ver 2.22
NET: Registered PF_BLUETOOTH protocol family
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
Bluetooth: L2CAP socket layer initialized
Bluetooth: SCO socket layer initialized
NET: Registered PF_ATMPVC protocol family
NET: Registered PF_ATMSVC protocol family
NetLabel: Initializing
NetLabel:  domain hash size = 128
NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
NetLabel:  unlabeled traffic allowed by default
nfc: nfc_init: NFC Core ver 0.1
NET: Registered PF_NFC protocol family
PCI: Using ACPI for IRQ routing
pci 0000:00:05.0: vgaarb: setting as boot VGA device
pci 0000:00:05.0: vgaarb: bridge control possible
pci 0000:00:05.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
vgaarb: loaded
clocksource: Switched to clocksource kvm-clock
VFS: Disk quotas dquot_6.6.0
VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
TOMOYO: 2.6.0
Mandatory Access Control activated.
AppArmor: AppArmor Filesystem Enabled
pnp: PnP ACPI init
pnp: PnP ACPI: found 7 devices
clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
NET: Registered PF_INET protocol family
IP idents hash table entries: 131072 (order: 8, 1048576 bytes, linear)
------------[ cut here ]------------
refcount_t: decrement hit 0; leaking memory.
WARNING: CPU: 0 PID: 1 at lib/refcount.c:31 refcount_warn_saturate+0x1ed/0x210 lib/refcount.c:31
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/29/2024
RIP: 0010:refcount_warn_saturate+0x1ed/0x210 lib/refcount.c:31
Code: 86 e8 57 23 ca fe 90 0f 0b 90 90 e9 c3 fe ff ff e8 18 fb 03 ff c6 05 33 52 3d 07 01 90 48 c7 c7 00 29 e7 86 e8 34 23 ca fe 90 <0f> 0b 90 90 e9 a0 fe ff ff 48 89 ef e8 b2 d4 55 ff e9 44 fe ff ff
RSP: 0000:ffffc9000001fba0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8118c199
RDX: ffff8881012b0000 RSI: ffffffff8118c1a6 RDI: 0000000000000001
RBP: ffff888106eecb6c R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: ffff888106eecb6c
R13: 0000000000000000 R14: 00000000016a005a R15: ffff888106885f28
FS:  0000000000000000(0000) GS:ffff8881f6400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000829e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __refcount_dec include/linux/refcount.h:336 [inline]
 refcount_dec include/linux/refcount.h:351 [inline]
 dec_stack_record_count mm/page_owner.c:215 [inline]
 __reset_page_owner+0x2ea/0x370 mm/page_owner.c:253
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1141 [inline]
 __free_pages_ok+0x5d0/0xbd0 mm/page_alloc.c:1270
 make_alloc_exact+0x165/0x260 mm/page_alloc.c:4829
 alloc_large_system_hash+0x4e0/0x640 mm/mm_init.c:2530
 inet_hashinfo2_init+0x4b/0xd0 net/ipv4/inet_hashtables.c:1193
 tcp_init+0xba/0x9f0 net/ipv4/tcp.c:4708
 inet_init+0x419/0x6f0 net/ipv4/af_inet.c:2029
 do_one_initcall+0x128/0x700 init/main.c:1238
 do_initcall_level init/main.c:1300 [inline]
 do_initcalls init/main.c:1316 [inline]
 do_basic_setup init/main.c:1335 [inline]
 kernel_init_freeable+0x69d/0xca0 init/main.c:1548
 kernel_init+0x1c/0x2b0 init/main.c:1437
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

