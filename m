Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1DADA34C
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 03:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404139AbfJQBmO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 21:42:14 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:52909 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395085AbfJQBmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 21:42:14 -0400
Received: by mail-il1-f198.google.com with SMTP id h22so136901ild.19
        for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2019 18:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=PQRjAFW5dVe30Rm5k0ab2lF/+wmycVZIjpbEMijdEW4=;
        b=GdUndxqQTW46+dsA/9O65bQE8IQofixlSHspV7FFwfs5VBW5ouynI6KTUw2cVdz4VR
         hKIAxURXXcuDNRHVBA+jJnrK4qx4bLTiGl1LbkB8f4wpz9V+/sFtS2i9+iLl9yooGGOm
         KlTBbcPsaj0J+mLwF/jwpFZBl473UZ0gGu0zanRXOxzFeBonFKY+/bYMNhLIQENr58Ne
         miXRAmy90OX2sDXZKdPFquy2mnp1rJT95lwXg+UdrVNDYGcWcCeXfkAqu+TYT6JPh/Qn
         ZWwVfcmGMl4LzQLAHdJDF//B2oDsxZj1G1z/l4x+A2dtgLXtAhnf0G6Ks9v/tyBtVW/i
         PYDA==
X-Gm-Message-State: APjAAAXrZ4QTsBQA1rgAwa9I3VhnCG8Mh9iDRRs/jSBsgrL5O9G2tnTR
        nhM3jU6QgcZi26BZXivy4N/0nAQAmUzIMPh4yUv0g4AW2mRP
X-Google-Smtp-Source: APXvYqwuIPj6BjU0d3hgoHxU2oS7zjAiwmbCQIBYswGV9bVJjS86KE/kxeBR13qAEJjicjqxuGI9Vi11Dcyku4xgdOdR0fZ2LwMg
MIME-Version: 1.0
X-Received: by 2002:a92:490f:: with SMTP id w15mr970587ila.187.1571276531941;
 Wed, 16 Oct 2019 18:42:11 -0700 (PDT)
Date:   Wed, 16 Oct 2019 18:42:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000087ce3a0595115382@google.com>
Subject: BUG: bad usercopy in ld_usb_read (3)
From:   syzbot <syzbot+acee996f6938b9ded381@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, andreyknvl@google.com, cai@lca.pw,
        info@metux.net, isaacm@codeaurora.org, keescook@chromium.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1756ff77600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=acee996f6938b9ded381
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+acee996f6938b9ded381@syzkaller.appspotmail.com

ldusb 5-1:0.28: Read buffer overflow, 177886378725897 bytes dropped
usercopy: Kernel memory exposure attempt detected from process stack  
(offset 0, size 2147479552)!
------------[ cut here ]------------
kernel BUG at mm/usercopy.c:99!
invalid opcode: 0000 [#1] SMP KASAN
CPU: 1 PID: 6543 Comm: syz-executor.5 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:99
Code: e8 32 51 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 40  
d9 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 46 e3 c0 ff <0f> 0b e8 06 51  
d6 ff e8 31 8b fd ff 8b 54 24 04 49 89 d8 4c 89 e1
RSP: 0018:ffff8881d35f7c58 EFLAGS: 00010282
RAX: 0000000000000061 RBX: ffffffff85cdd660 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128bcbd RDI: ffffed103a6bef7d
RBP: ffffffff85cdd820 R08: 0000000000000061 R09: fffffbfff11b23be
R10: fffffbfff11b23bd R11: ffffffff88d91def R12: ffffffff85cdda40
R13: ffffffff85cdd660 R14: 000000007ffff000 R15: ffffffff85cdd660
FS:  00007fb330338700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f07cea47000 CR3: 00000001cc11e000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  __check_object_size mm/usercopy.c:282 [inline]
  __check_object_size.cold+0x91/0xbb mm/usercopy.c:256
  check_object_size include/linux/thread_info.h:119 [inline]
  check_copy_size include/linux/thread_info.h:150 [inline]
  copy_to_user include/linux/uaccess.h:151 [inline]
  ld_usb_read+0x31a/0x760 drivers/usb/misc/ldusb.c:492
  __vfs_read+0x76/0x100 fs/read_write.c:425
  vfs_read+0x1ea/0x430 fs/read_write.c:461
  ksys_read+0x1e8/0x250 fs/read_write.c:587
  do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459a59
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fb330337c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459a59
RDX: 00000000ffffffad RSI: 0000000020003200 RDI: 0000000000000004
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fb3303386d4
R13: 00000000004c7120 R14: 00000000004dcae8 R15: 00000000ffffffff
Modules linked in:
---[ end trace 0fa22c64036b6ebe ]---
RIP: 0010:usercopy_abort+0xb9/0xbb mm/usercopy.c:99
Code: e8 32 51 d6 ff 49 89 d9 4d 89 e8 4c 89 e1 41 56 48 89 ee 48 c7 c7 40  
d9 cd 85 ff 74 24 08 41 57 48 8b 54 24 20 e8 46 e3 c0 ff <0f> 0b e8 06 51  
d6 ff e8 31 8b fd ff 8b 54 24 04 49 89 d8 4c 89 e1
RSP: 0018:ffff8881d35f7c58 EFLAGS: 00010282
RAX: 0000000000000061 RBX: ffffffff85cdd660 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8128bcbd RDI: ffffed103a6bef7d
RBP: ffffffff85cdd820 R08: 0000000000000061 R09: fffffbfff11b23be
R10: fffffbfff11b23bd R11: ffffffff88d91def R12: ffffffff85cdda40
R13: ffffffff85cdd660 R14: 000000007ffff000 R15: ffffffff85cdd660
FS:  00007fb330338700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f07cea47000 CR3: 00000001cc11e000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
