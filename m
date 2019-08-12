Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4153A89DE6
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 14:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfHLMSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 08:18:08 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:34082 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbfHLMSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 08:18:08 -0400
Received: by mail-ot1-f72.google.com with SMTP id a26so9903631otl.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 05:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HE41aQnnYETdEANyFEPblmThr+Q+EQY5pBAaLLDah5Y=;
        b=Rm8lgluwBySmpVE5b9z4wTIN04XiHlsy1PcGJ5XQ+ElN5XYPAuBYNkdPL0L4a9T51R
         pelRvkaDPGJdFOD4Hk0AOIkQT5iq7c03t5mFXKq8fx9hLRQ7aAoQTereozb0GXs7xiba
         z150jIILlEHqiYOvibu+CUeEUAwuG0DQxxOmalry3lhqTVlg1wS3ob3zp8ckGO6XrXeH
         QOIUJFR8BckyLQsBubQPPwsECXD9H4R8WLYk6clSfJEvLUhkWG5omyxhLkliQQ1Hj9rm
         yRXeIZOHpzYbHvuEFG7jYA2ImPgt05TU6Hwqh8hrP4zRh+DbaVRtdTee63pPwh098rzi
         MJkA==
X-Gm-Message-State: APjAAAW8pcNA6yY1pq2S18vaEAHt6A6OIwvJ2JdpRYeKpDwMxr0yecIt
        4MoE8J9nGRN3vkyu+9YyYcVJfmekYv64xLFeEB8buElhKl7C
X-Google-Smtp-Source: APXvYqwfmmWSJkYDsPBzJMOL/8RGs4Z1sDIakFAvAHcDWmJbKHRbG0ouvbD1zdyALkCXJRX07/brKyyJg87J5xNMKZkkig0gs6hC
MIME-Version: 1.0
X-Received: by 2002:a5e:924d:: with SMTP id z13mr31864230iop.247.1565612287195;
 Mon, 12 Aug 2019 05:18:07 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:18:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003c013f058fea8493@google.com>
Subject: KASAN: slab-out-of-bounds Read in ld_usb_read
From:   syzbot <syzbot+ba00d6a2a24df57a94ca@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bhelgaas@google.com,
        enric.balletbo@collabora.com, gregkh@linuxfoundation.org,
        kirr@nexedi.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@roeck-us.net, lkundrak@v3.sk,
        logang@deltatee.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=162aac02600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
dashboard link: https://syzkaller.appspot.com/bug?extid=ba00d6a2a24df57a94ca
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1123edc2600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16079d2c600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+ba00d6a2a24df57a94ca@syzkaller.appspotmail.com

ldusb 1-1:0.28: Read buffer overflow, -131386046930688 bytes dropped
==================================================================
BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x124/0x150  
lib/usercopy.c:27
Read of size 2147479552 at addr ffff8881cd580008 by task  
syz-executor268/1890

CPU: 0 PID: 1890 Comm: syz-executor268 Not tainted 5.3.0-rc2+ #25
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  _copy_to_user+0x124/0x150 lib/usercopy.c:27
  copy_to_user include/linux/uaccess.h:152 [inline]
  ld_usb_read+0x31a/0x780 drivers/usb/misc/ldusb.c:495
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x1e8/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x441c49
Code: e8 8c e8 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb 08 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd920003d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441c49
RDX: 00000000fffffd68 RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00000000000305b5 R08: 000000000000000f R09: 0000000000402a30
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000004029a0
R13: 0000000000402a30 R14: 0000000000000000 R15: 0000000000000000

The buggy address belongs to the page:
page:ffffea0007356000 refcount:1 mapcount:0 mapping:0000000000000000  
index:0x0 compound_mapcount: 0
flags: 0x200000000010000(head)
raw: 0200000000010000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881cd595500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff8881cd595580: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881cd595600: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
                    ^
  ffff8881cd595680: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
  ffff8881cd595700: fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe fe
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
