Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6F971899
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389881AbfGWMsI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:48:08 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:34128 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731293AbfGWMsI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 08:48:08 -0400
Received: by mail-io1-f69.google.com with SMTP id u84so47187975iod.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2019 05:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=bufwRie9uiSRG0LXeYukjxTuwaoluQKSW+6J20CVJeA=;
        b=i+2PnGGY70rcwKf9gdcyV5+S4tj7ioU3exAvx5U6iMXuoImMR0fBqJoV2ZZ6CkuIie
         Z4bTMY2woag5h/M3oQ0hb7SUp1TxRNW3zV6p6QBchKb9gLTw/OX2ke9mc72o3bQlEFtF
         lGkw++o8bh/jYBEf3ExJK8Y19sWnT8AXsj8111ZZAmTEgIE6rWKPotWiZXAkPAHJyOsM
         yUmTKYWPoS/TiSCQ1u8SNMTtDef0aY0go29TavYL7a3IDgCCG7FAwIRrqmW4Nx2Xj3hj
         max8vnxzUfs66Dcx6qMPdsAfG8HQWeZ+OBoOieckgUZ1oZxhLlx1jX1QH0/m6+ldfdgN
         Gjfg==
X-Gm-Message-State: APjAAAWo8//8ZbqkRY6dI7v/evcsjkiDe9kRR9R6MvEjPBjznDIOiroM
        cX6iiD9DB58/y1QHAllk474QqMK8pEkMhG+6SOp0m7aCKieW
X-Google-Smtp-Source: APXvYqzGfk0PBuj9VdE29RXFYkYPn0ixLarzYj0wdHxsQz8CbhLzQq+Ouan5FFnxfkxOJ8qkwNnX+u7lIKRjuQCy6zDBNQn7c/CP
MIME-Version: 1.0
X-Received: by 2002:a6b:f910:: with SMTP id j16mr42970258iog.256.1563886087473;
 Tue, 23 Jul 2019 05:48:07 -0700 (PDT)
Date:   Tue, 23 Jul 2019 05:48:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b69261058e589a1b@google.com>
Subject: INFO: trying to register non-static key in usbtouch_open
From:   syzbot <syzbot+f9c21a30eb9d374e30c1@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=16330920600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
dashboard link: https://syzkaller.appspot.com/bug?extid=f9c21a30eb9d374e30c1
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e5ee78600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e4a74c600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f9c21a30eb9d374e30c1@syzkaller.appspotmail.com

INFO: trying to register non-static key.
the code is fine but needs lockdep annotation.
turning off the locking correctness validator.
CPU: 0 PID: 1737 Comm: syz-executor481 Not tainted 5.2.0-rc6+ #15
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack /lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e /lib/dump_stack.c:113
  assign_lock_key /kernel/locking/lockdep.c:775 [inline]
  register_lock_class+0x11ae/0x1240 /kernel/locking/lockdep.c:1084
  __lock_acquire+0x11d/0x5340 /kernel/locking/lockdep.c:3674
  lock_acquire+0x100/0x2b0 /kernel/locking/lockdep.c:4303
  __mutex_lock_common /kernel/locking/mutex.c:926 [inline]
  __mutex_lock+0xf9/0x12b0 /kernel/locking/mutex.c:1073
  usbtouch_open+0x101/0x310 /drivers/input/touchscreen/usbtouchscreen.c:1537
  input_open_device+0x170/0x280 /drivers/input/input.c:607
  evdev_open_device /drivers/input/evdev.c:433 [inline]
  evdev_open+0x3fe/0x510 /drivers/input/evdev.c:518
  chrdev_open+0x219/0x5c0 /fs/char_dev.c:413
  do_dentry_open+0x497/0x1040 /fs/open.c:778
  do_last /fs/namei.c:3416 [inline]
  path_openat+0x1430/0x3ff0 /fs/namei.c:3533
  do_filp_open+0x1a1/0x280 /fs/namei.c:3563
  do_sys_open+0x3c0/0x580 /fs/open.c:1070
  do_syscall_64+0xb7/0x560 /arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4011f0
Code: 01 f0 ff ff 0f 83 00 0b 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f  
44 00 00 83 3d 9d 4b 2d 00 00 75 14 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 d4 0a 00 00 c3 48 83 ec 08 e8 3a 00 00 00
RSP: 002b:00007ffdc8662728 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004011f0
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00007ffdc8662730
RBP: 6666666666666667 R08: 000000000000000f R09: 0000000000000023
R10: 0000000000000075 R11: 0000000000000246 R12: 0000000000402150
R13: 00000000004021e0 R14: 0000000000000000 R15: 0000000000000000


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
