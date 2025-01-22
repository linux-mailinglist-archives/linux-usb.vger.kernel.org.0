Return-Path: <linux-usb+bounces-19626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D96A1920B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C1E3A2B8A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E39212FB7;
	Wed, 22 Jan 2025 13:07:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D321DF26F
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737551242; cv=none; b=LZxcCn6D6VFv7rjyRiQGoM9L1y0Qozcl5ZDfwA1A/S4FuyAccGTYUEdRUYTpyNq+Usl/DhW/4rYLD/yI84PrdCdN8wFTCbEE3olRJF+lHXA/YaepNmkRSuxPjmKkc+vd/CbUm5DTUTnebe1WddZKc460O2XK6lIeu4WS7qiqFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737551242; c=relaxed/simple;
	bh=LAydCAjYtmwWWys/3CVGQ30cEZ4T4j3Il2TXOg4s0rg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MXtuw1jCKDyvmG7SkAl72kMnqFAv1MsTrJfQ95aLqofAK6qj1F8lgELEsLG69soI04r9PWpEHLg771CPsSQcSr93/uRsw0Xs7TCMNDH+VbQ5b+Svr+udwJ3Je0ee5eB84CYQmSAM02vao2Z9rQvWSuI+K3sV/I9r9JG1KU6LI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ce3bbb2b9dso42974735ab.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 05:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737551239; x=1738156039;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDhpeV1kCjILGzMz3ohWQx/Btxz1Z/0jmClB6/+REJY=;
        b=ohzN70ZCelqlixvEfn4eESjAmtLctxar6BrYZTRKoN+rfoR30yuQAHIiLWmBICHVy+
         sAfsurBd7G9d8VJJr96IxuPVCyA7PR3xE0/I5UBar3cpUChr2phF25WYqtU00RgEBUVg
         W/cndHUhuazsVyVumclOLQQe27jJ1EQDZBBDxURc5Pbh66VgoQIfq/kfwf+VPIS51RhY
         68UInPCU7C1XrbfHQUkknpLtAwXvGMHL7Kh4YRezWAlbW9Bbhiultk2S8YJh2i/ZNIsL
         mA9yaAqSbh+ztM6dEBK/4XqSnqyAzJo47CDf+EKZG9ghI0zp84+swV4Fmf5t99GFHp9w
         CWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwBVFF31lFtSM3KQRBHNP0acsY0ey/d5vlEAVBCBwtuGJ2T3lkoWL2iBgmVcet2nzUlSCNalacPA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LUKKBmcGd3MExgFiQ9PEWex/+YXdVvGtOlugkypBambHiZQ6
	6Ai5fNhta28YsmRkUHNvdQ2uK/s/A3hzO7tqdMKTZEwn2EK6hVl2ICNRLtIfjctGmg6vFgp6kPR
	604pRK73JnKv6mTmKQKzWmzQBvymIlxvHF1jOcfd3t5PoYJotsJJmETg=
X-Google-Smtp-Source: AGHT+IE88i4f3CdDYnOcVdWcIogETJjWejvbL2BHKqsR+3VuHEbouyojasC8tlhs2/bx22/34KkIVT5sFmR/5C8stt3s/btac3hl
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:221d:b0:3ce:78e5:d36d with SMTP id
 e9e14a558f8ab-3cf744199c7mr193830575ab.12.1737551239120; Wed, 22 Jan 2025
 05:07:19 -0800 (PST)
Date: Wed, 22 Jan 2025 05:07:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6790ed87.050a0220.194594.0011.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in send_packet
From: syzbot <syzbot+d5cffbb6c3699d702a40@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, sean@mess.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    36a889968e69 usb: dwc3: omap: Fix devm_regulator_get_optio..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1442d3c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e27867f71e8bc406
dashboard link: https://syzkaller.appspot.com/bug?extid=d5cffbb6c3699d702a40
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a47eaf275c09/disk-36a88996.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/45c5c8267b41/vmlinux-36a88996.xz
kernel image: https://storage.googleapis.com/syzbot-assets/882b63b79dd4/bzImage-36a88996.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d5cffbb6c3699d702a40@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in __create_pipe include/linux/usb.h:1984 [inline]
BUG: KASAN: slab-use-after-free in send_packet+0xa7f/0xc20 drivers/media/rc/imon.c:627
Read of size 4 at addr ffff888134c5d000 by task syz.2.1758/10975

CPU: 1 UID: 0 PID: 10975 Comm: syz.2.1758 Not tainted 6.13.0-rc4-syzkaller-00088-g36a889968e69 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 __create_pipe include/linux/usb.h:1984 [inline]
 send_packet+0xa7f/0xc20 drivers/media/rc/imon.c:627
 vfd_write+0x2f2/0x5f0 drivers/media/rc/imon.c:989
 vfs_write+0x24c/0x1150 fs/read_write.c:677
 ksys_write+0x12b/0x250 fs/read_write.c:731
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2184745d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f2182d90038 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2184936080 RCX: 00007f2184745d29
RDX: 0000000000000001 RSI: 0000000020000000 RDI: 0000000000000004
RBP: 00007f21847c1b08 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f2184936080 R15: 00007ffc18e64638
 </TASK>

Allocated by task 41:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 usb_alloc_dev+0x55/0xdc0 drivers/usb/core/usb.c:650
 hub_port_connect drivers/usb/core/hub.c:5424 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x28f9/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Freed by task 5581:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x130/0x470 mm/slub.c:4761
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff888134c5d000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 0 bytes inside of
 freed 2048-byte region [ffff888134c5d000, ffff888134c5d800)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x134c58
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff888100042000 ffffea000467e600 dead000000000002
raw: 0000000000000000 0000000000080008 00000001f5000000 0000000000000000
head: 0200000000000040 ffff888100042000 ffffea000467e600 dead000000000002
head: 0000000000000000 0000000000080008 00000001f5000000 0000000000000000
head: 0200000000000003 ffffea0004d31601 ffffffffffffffff 0000000000000000
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5265, tgid 5265 (kworker/1:4), ts 307215602966, free_ts 274665670820
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0xeb/0x400 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xd1d/0x16e0 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __do_kmalloc_node mm/slub.c:4297 [inline]
 __kmalloc_node_track_caller_noprof+0x157/0x4c0 mm/slub.c:4317
 kmalloc_reserve+0xef/0x2c0 net/core/skbuff.c:609
 pskb_expand_head+0x243/0x1240 net/core/skbuff.c:2275
 netlink_trim+0x1ef/0x250 net/netlink/af_netlink.c:1303
 netlink_broadcast_filtered+0xc7/0xef0 net/netlink/af_netlink.c:1509
 nlmsg_multicast_filtered include/net/netlink.h:1128 [inline]
 nlmsg_multicast include/net/netlink.h:1147 [inline]
 nlmsg_notify+0x9e/0x220 net/netlink/af_netlink.c:2585
 rtnl_notify net/core/rtnetlink.c:943 [inline]
 rtmsg_ifinfo_send net/core/rtnetlink.c:4376 [inline]
 rtmsg_ifinfo_event net/core/rtnetlink.c:4392 [inline]
 rtmsg_ifinfo_event net/core/rtnetlink.c:4379 [inline]
 rtmsg_ifinfo+0x174/0x1a0 net/core/rtnetlink.c:4398
 register_netdevice+0x18b5/0x1e90 net/core/dev.c:10646
 register_netdev+0x2f/0x50 net/core/dev.c:10736
page last free pid 2833 tgid 2833 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0xe40 mm/page_alloc.c:2659
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 kmem_cache_alloc_node_noprof+0x150/0x3b0 mm/slub.c:4220
 __alloc_skb+0x2b1/0x380 net/core/skbuff.c:668
 alloc_skb include/linux/skbuff.h:1323 [inline]
 alloc_skb_with_frags+0xe4/0x850 net/core/skbuff.c:6612
 sock_alloc_send_pskb+0x7f1/0x980 net/core/sock.c:2881
 unix_dgram_sendmsg+0x467/0x1920 net/unix/af_unix.c:2027
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg net/socket.c:726 [inline]
 __sys_sendto+0x488/0x4f0 net/socket.c:2197
 __do_sys_sendto net/socket.c:2204 [inline]
 __se_sys_sendto net/socket.c:2200 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2200
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888134c5cf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888134c5cf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888134c5d000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888134c5d080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888134c5d100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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

