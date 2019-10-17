Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20348DA355
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 03:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393064AbfJQBmd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 21:42:33 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:49362 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394879AbfJQBmM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 21:42:12 -0400
Received: by mail-io1-f71.google.com with SMTP id e14so902810iot.16
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 18:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=c+/W7PtNRLYMAumQPSj2+lTREnQ1B5FgENo3ueNmxr0=;
        b=aXAGR+ftuMn4Vc5BAEET4178vxhGN8+c1WO2S5L+NTAUSedo2TV0yBGnFWXJFwYaMj
         xlFn/vAD4So4iVT/wP4Grr0CxMcxLOiIE0eXCnd9x6snByZfb2eK7cCNgp2nRGpnR8Vw
         zgBt8dWajsJcBrgbhWS73c2+5XkEY23hfM3KIMO2ED1TNo6rk6HEiflMdve8dv8dkOFg
         Vl9pL8jnCBAtEr35CXQ2rZvqh5oABB3nSZGpudixe4HZI/Lyxb4KP5uP40qX/IeCmxxh
         HAUqG/lhoG6mabP86lva9NbPU2hO4sV5DlwAh5ERLiqjwTh3ZqlO3K0QzlXKr9MC2Kxj
         kDaA==
X-Gm-Message-State: APjAAAWtl4zE43Yru1i1yXwWzGMa942DsEgOvQOU8reDXtYYFxu0cas0
        zl5A6ZDIiojOsLX27S7ryeByT0NCuA0978704o3mY8jUA1ZP
X-Google-Smtp-Source: APXvYqy7CVv/UIN/GUWAS7Syffhmzin1EXRNZnA3epFNO2oJKKVLlSSpze70HYuTSbZUmNzkMFcKy/7TY2q9w6n0/qLIeDJl4Qs9
MIME-Version: 1.0
X-Received: by 2002:a5e:dd4d:: with SMTP id u13mr678477iop.7.1571276530385;
 Wed, 16 Oct 2019 18:42:10 -0700 (PDT)
Date:   Wed, 16 Oct 2019 18:42:10 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000070102d059511537d@google.com>
Subject: KASAN: slab-out-of-bounds Read in ld_usb_read (3)
From:   syzbot <syzbot+6fe95b826644f7f12b0b@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, enric.balletbo@collabora.com,
        gregkh@linuxfoundation.org, johan@kernel.org, kirr@nexedi.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@roeck-us.net, logang@deltatee.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14f6dc5f600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=6fe95b826644f7f12b0b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=102c3227600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a503a0e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6fe95b826644f7f12b0b@syzkaller.appspotmail.com

ldusb 1-1:0.28: Read buffer overflow, -131383859965943 bytes dropped
==================================================================
BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x124/0x150  
lib/usercopy.c:28
Read of size 102391 at addr ffff8881cfb40008 by task syz-executor372/1737

CPU: 0 PID: 1737 Comm: syz-executor372 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  _copy_to_user+0x124/0x150 lib/usercopy.c:28
  copy_to_user include/linux/uaccess.h:152 [inline]
  ld_usb_read+0x329/0x760 drivers/usb/misc/ldusb.c:492
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x1e8/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4421d9
Code: e8 7c e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 bb 07 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc08eb0888 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007ffc08eb0ae0 RCX: 00000000004421d9
RDX: 0000000000018ff7 RSI: 0000000020000a80 RDI: 0000000000000004
RBP: 0000000000000000 R08: 000000000000000f R09: 0000000000402eb0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000402eb0 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the page:
page:ffffea00073ed000 refcount:1 mapcount:0 mapping:0000000000000000  
index:0x0 compound_mapcount: 0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cfb55500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881cfb55580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881cfb55600: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                    ^
  ffff8881cfb55680: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881cfb55700: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
