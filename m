Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F5474E1D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 14:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbfGYM1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 08:27:02 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:46328 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728567AbfGYM1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 08:27:02 -0400
Received: by mail-io1-f72.google.com with SMTP id s83so54706514iod.13
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2019 05:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=s0AvgKAkeAovU1xPhVjcthy08rpdy59LprND+JYlx+0=;
        b=PK8I2cztVWv961SmD8dimVmUieoS3/vmWiFMfmuHdX0LFMWcGalqFIShdIp0CD3RIo
         hRX2q37/QO22geKdVldobMqjkCYI3+22SEq1fV5FEs3UO98Pjr2Shco6Qn3E4Ek/uBwt
         cIljEW0BNkdJWHjzwFT/Xtvegbi6s7B8pf0I1BondFMd1CmvOwcb+HfVvHbrKuhkoLKK
         QSDmqvCb1y6Sj7MWA6sV2BzGL1Jgym7Nbh80yEbX+waB5Z2YjAGbBriFOzBfU1z+JAcU
         138mtQ+0mr+P+hkzILkRLYwQoC7zL8au15DSp80i4Z98A9M2CmBj4YcZx6ctqUEl4p90
         47iQ==
X-Gm-Message-State: APjAAAWc91L7Jt/TpBBswubcdAZbjpmW8yxThWJDfNTm8FMfJnwiaq8H
        AgWvLP+k2hX1FXaqoIOwK1L8RUP1XtBEo/xDMTlHWDVqXKnk
X-Google-Smtp-Source: APXvYqzvblkLBgHuRJgWcj/lkpgN5YdqvAH2zrwXp+7CM4EDctbxGX+uGuFkYgWqcjSZUyoZ+Q3tmCKPZHJHPhWsnD2msIBOhrLn
MIME-Version: 1.0
X-Received: by 2002:a05:6638:627:: with SMTP id h7mr60956519jar.33.1564057621138;
 Thu, 25 Jul 2019 05:27:01 -0700 (PDT)
Date:   Thu, 25 Jul 2019 05:27:01 -0700
In-Reply-To: <1564056947.14544.0.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ea97c9058e808ab6@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
From:   syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
KASAN: use-after-free Read in usbhid_power

==================================================================
BUG: KASAN: use-after-free in __lock_acquire+0x3a5d/0x5340  
kernel/locking/lockdep.c:3665
Read of size 8 at addr ffff8881c82c68a0 by task syz-executor.2/2950

CPU: 1 PID: 2950 Comm: syz-executor.2 Not tainted 5.2.0-rc6+ #1
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x67/0x231 mm/kasan/report.c:188
  __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  __lock_acquire+0x3a5d/0x5340 kernel/locking/lockdep.c:3665
  lock_acquire+0x100/0x2b0 kernel/locking/lockdep.c:4303
  __raw_spin_lock_irq include/linux/spinlock_api_smp.h:128 [inline]
  _raw_spin_lock_irq+0x2d/0x40 kernel/locking/spinlock.c:167
  spin_lock_irq include/linux/spinlock.h:363 [inline]
  usbhid_power+0x4a/0x240 drivers/hid/usbhid/hid-core.c:1232
  hid_hw_power include/linux/hid.h:1038 [inline]
  hidraw_open+0x20d/0x740 drivers/hid/hidraw.c:282
  chrdev_open+0x219/0x5c0 fs/char_dev.c:413
  do_dentry_open+0x497/0x1040 fs/open.c:778
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3ff0 fs/namei.c:3533
  do_filp_open+0x1a1/0x280 fs/namei.c:3563
  do_sys_open+0x3c0/0x580 fs/open.c:1070
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413711
Code: 75 14 b8 02 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 19 00 00 c3 48  
83 ec 08 e8 0a fa ff ff 48 89 04 24 b8 02 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fa ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007fd4b6cf27a0 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 6666666666666667 RCX: 0000000000413711
RDX: 0000000000000000 RSI: 0000000000000800 RDI: 00007fd4b6cf2850
RBP: 000000000075bfc8 R08: 000000000000000f R09: 0000000000000000
R10: 00007fd4b6cf39d0 R11: 0000000000000293 R12: 00007fd4b6cf36d4
R13: 00000000004c8a7a R14: 00000000004df748 R15: 00000000ffffffff

Allocated by task 2939:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:489 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
  slab_post_alloc_hook mm/slab.h:437 [inline]
  slab_alloc_node mm/slub.c:2748 [inline]
  __kmalloc_node_track_caller+0xee/0x370 mm/slub.c:4363
  __kmalloc_reserve.isra.0+0x39/0xe0 net/core/skbuff.c:138
  __alloc_skb+0xef/0x5a0 net/core/skbuff.c:206
  alloc_skb include/linux/skbuff.h:1054 [inline]
  netlink_alloc_large_skb net/netlink/af_netlink.c:1179 [inline]
  netlink_sendmsg+0x8d6/0xcc0 net/netlink/af_netlink.c:1897
  sock_sendmsg_nosec net/socket.c:646 [inline]
  sock_sendmsg+0xcf/0x120 net/socket.c:665
  ___sys_sendmsg+0x803/0x920 net/socket.c:2286
  __sys_sendmsg+0xec/0x1b0 net/socket.c:2324
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 2939:
  save_stack+0x1b/0x80 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
  slab_free_hook mm/slub.c:1421 [inline]
  slab_free_freelist_hook mm/slub.c:1448 [inline]
  slab_free mm/slub.c:2994 [inline]
  kfree+0xd7/0x280 mm/slub.c:3949
  skb_free_head+0x8b/0xa0 net/core/skbuff.c:588
  skb_release_data+0x41f/0x7c0 net/core/skbuff.c:608
  skb_release_all+0x46/0x60 net/core/skbuff.c:662
  __kfree_skb net/core/skbuff.c:676 [inline]
  consume_skb net/core/skbuff.c:736 [inline]
  consume_skb+0xc0/0x2f0 net/core/skbuff.c:730
  netlink_unicast_kernel net/netlink/af_netlink.c:1308 [inline]
  netlink_unicast+0x4d7/0x690 net/netlink/af_netlink.c:1333
  netlink_sendmsg+0x80b/0xcc0 net/netlink/af_netlink.c:1922
  sock_sendmsg_nosec net/socket.c:646 [inline]
  sock_sendmsg+0xcf/0x120 net/socket.c:665
  ___sys_sendmsg+0x803/0x920 net/socket.c:2286
  __sys_sendmsg+0xec/0x1b0 net/socket.c:2324
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881c82c6880
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 32 bytes inside of
  1024-byte region [ffff8881c82c6880, ffff8881c82c6c80)
The buggy address belongs to the page:
page:ffffea000720b100 refcount:1 mapcount:0 mapping:ffff8881dac02a00  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000200 ffff8881dac02a00
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881c82c6780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c82c6800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8881c82c6880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                ^
  ffff8881c82c6900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881c82c6980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git  
usb-fuzzer-usb-testing-2019.07.11
console output: https://syzkaller.appspot.com/x/log.txt?x=125edb68600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16e76a7c600000

