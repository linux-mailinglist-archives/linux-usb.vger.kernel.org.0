Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0A888225
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 20:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436751AbfHISSM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 14:18:12 -0400
Received: from mail-ot1-f69.google.com ([209.85.210.69]:55075 "EHLO
        mail-ot1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407091AbfHISSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 14:18:08 -0400
Received: by mail-ot1-f69.google.com with SMTP id h26so70517247otr.21
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 11:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Y2L+nyfU2q8wHXsbDGxBb0OTl9a2LvGPbF4amlYpYck=;
        b=k6H3tQUjhc8OyRLPV1qVHnuzRyQ44T+BD7O+y55AtW0jsUYwfMkULh2DmtF6fVmabL
         KYf7Z5mQLcGpTaXSeG7V+7f2SoXs9KGjRh18LTRP5BQxPskrDoBvxocSYsX48g/aRQ+h
         N60TPfj3nZGM4Dkl1xFg9MQ/9txl3ijsTLfDcG/M4VA3u3Qt4XzvGNhCQoTqwdkx4q1i
         iESl0QiR7J9hU6QZ+41fMUpYlf84KrXeZ2XXK8CT51Rm0cuRFxXavYzVRXVGzTlFuGkv
         ivdBECNLDG9geyERvZCptoNuLcvGye2G37rn4qe57yEMt4RqatphDKmXajCLFeJcS4l/
         YQXw==
X-Gm-Message-State: APjAAAV2p86siFZbVfKtDd+DGWKSw30RQlGq/9ZRNQdmV7I1l+jmhlWY
        8+TaK/XUc+tkI4TijWVnQVvqEPGuwdmznOeqRtV0N8ilTyGH
X-Google-Smtp-Source: APXvYqztRd/lbloiqUkFenFyig+D96woBzsopwy0n5xUOd9frwUELiEUZNPGdhjoSEBfFRT1kUw+YcmDD/Pnyz4Ljb4NU1/P+ucD
MIME-Version: 1.0
X-Received: by 2002:a5d:9386:: with SMTP id c6mr15947872iol.81.1565374687687;
 Fri, 09 Aug 2019 11:18:07 -0700 (PDT)
Date:   Fri, 09 Aug 2019 11:18:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000333f53058fb33243@google.com>
Subject: KASAN: out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+f817d84b72194c4a5fe2@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=126120e2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=f817d84b72194c4a5fe2
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f817d84b72194c4a5fe2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: out-of-bounds in hidraw_ioctl+0x609/0xae0  
drivers/hid/hidraw.c:380
Read of size 4 at addr ffff8881cb9fc018 by task syz-executor.1/3309

CPU: 1 PID: 3309 Comm: syz-executor.1 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  hidraw_ioctl+0x609/0xae0 drivers/hid/hidraw.c:380
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f877bde2c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 0000000020001300 RSI: 0000000080044801 RDI: 0000000000000004
RBP: 000000000075c118 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f877bde36d4
R13: 00000000004c2206 R14: 00000000004d5610 R15: 00000000ffffffff

Allocated by task 2751:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:487 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
  slab_post_alloc_hook mm/slab.h:520 [inline]
  slab_alloc_node mm/slub.c:2766 [inline]
  __kmalloc_node_track_caller+0xd0/0x230 mm/slub.c:4361
  __kmalloc_reserve.isra.0+0x39/0xe0 net/core/skbuff.c:141
  __alloc_skb+0xef/0x5a0 net/core/skbuff.c:209
  alloc_skb include/linux/skbuff.h:1055 [inline]
  alloc_uevent_skb+0x7b/0x210 lib/kobject_uevent.c:289
  uevent_net_broadcast_untagged lib/kobject_uevent.c:325 [inline]
  kobject_uevent_net_broadcast lib/kobject_uevent.c:408 [inline]
  kobject_uevent_env+0x8ee/0x1160 lib/kobject_uevent.c:592
  device_del+0x6b2/0xb10 drivers/base/core.c:2298
  usb_disconnect+0x4c3/0x8d0 drivers/usb/core/hub.c:2225
  hub_port_connect drivers/usb/core/hub.c:4949 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 238:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
  slab_free_hook mm/slub.c:1423 [inline]
  slab_free_freelist_hook mm/slub.c:1470 [inline]
  slab_free mm/slub.c:3012 [inline]
  kfree+0xe4/0x2f0 mm/slub.c:3953
  skb_free_head+0x8b/0xa0 net/core/skbuff.c:591
  skb_release_data+0x41f/0x7c0 net/core/skbuff.c:611
  skb_release_all+0x46/0x60 net/core/skbuff.c:665
  __kfree_skb net/core/skbuff.c:679 [inline]
  consume_skb net/core/skbuff.c:838 [inline]
  consume_skb+0xd9/0x320 net/core/skbuff.c:832
  skb_free_datagram+0x16/0xf0 net/core/datagram.c:328
  netlink_recvmsg+0x65e/0xee0 net/netlink/af_netlink.c:1996
  sock_recvmsg_nosec net/socket.c:871 [inline]
  sock_recvmsg net/socket.c:889 [inline]
  sock_recvmsg+0xca/0x110 net/socket.c:885
  ___sys_recvmsg+0x271/0x5a0 net/socket.c:2480
  __sys_recvmsg+0xe9/0x1b0 net/socket.c:2537
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8881cb9fc000
  which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 24 bytes inside of
  1024-byte region [ffff8881cb9fc000, ffff8881cb9fc400)
The buggy address belongs to the page:
page:ffffea00072e7f00 refcount:1 mapcount:0 mapping:ffff8881da002280  
index:0x0 compound_mapcount: 0
flags: 0x200000000010200(slab|head)
raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da002280
raw: 0000000000000000 00000000000e000e 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cb9fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  ffff8881cb9fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ffff8881cb9fc000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                             ^
  ffff8881cb9fc080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881cb9fc100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
